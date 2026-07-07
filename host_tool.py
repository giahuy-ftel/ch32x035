import serial
import serial.tools.list_ports
import struct
import binascii
import sys
import os


def calculate_crc32(data: bytes) -> int:
    crc = 0xFFFFFFFF
    for byte in data:
        crc ^= byte << 24
        for _ in range(8):
            if crc & 0x80000000:
                crc = ((crc << 1) ^ 0x04C11DB7) & 0xFFFFFFFF
            else:
                crc = (crc << 1) & 0xFFFFFFFF
    return crc ^ 0xFFFFFFFF


def generate_bin_from_elf(elf_path):
    bin_path = elf_path.replace(".elf", ".bin")
    import shutil

    objcopy = None
    for cmd in [
        "riscv64-unknown-elf-objcopy",
        "riscv64-elf-objcopy",
        "riscv-none-elf-objcopy",
    ]:
        if shutil.which(cmd):
            objcopy = cmd
            break
    if not objcopy:
        print("Error: No riscv objcopy tool found in PATH.")
        return None
    os.system(f"{objcopy} -O binary {elf_path} {bin_path}")
    with open(bin_path, "rb") as f:
        return bytearray(f.read())


def build_image(elf_path):
    if elf_path.endswith(".bin"):
        with open(elf_path, "rb") as f:
            payload = bytearray(f.read())
    else:
        payload = generate_bin_from_elf(elf_path)

    if not payload:
        return None

    rem = len(payload) % 256
    if rem != 0:
        payload += b"\xff" * (256 - rem)

    payload_size = len(payload)
    print(f"Payload size (padded): {payload_size} bytes")

    payload_crc = calculate_crc32(payload)

    flash_addr = 0x2000
    entry_point = flash_addr + 0x4

    header_prefix = struct.pack(
        "<I H H I I I H",
        0x46505455,
        1,
        32,
        payload_size,
        flash_addr,
        entry_point,
        0,
    )

    header_prefix += b"\x00" * (24 - len(header_prefix))

    header_crc = calculate_crc32(header_prefix)

    header = header_prefix + struct.pack("<I I", header_crc, payload_crc)

    return header + payload


def find_wch_port():
    ports = list(serial.tools.list_ports.comports())
    for p in ports:
        desc = p.description.lower()
        dev = p.device.lower()
        if (
            "wchlink" in desc
            or "wch" in desc
            or "wchlink" in dev
            or "usbmodem" in dev
            or "wch" in dev
        ):
            return p.device
    for p in ports:
        if "usbmodem" in p.device.lower() or "usbserial" in p.device.lower():
            return p.device
    return None


def main():
    if len(sys.argv) == 2:
        elf_path = sys.argv[1]
        port = find_wch_port()
        if not port:
            print(
                "Error: Could not auto-detect WCH-Link COM port. Please specify it manually."
            )
            print("Usage: python3 host_tool.py <port> <firmware.elf>")
            sys.exit(1)
        print(f"Auto-detected port: {port}")
    elif len(sys.argv) >= 3:
        port = sys.argv[1]
        elf_path = sys.argv[2]
    else:
        print("Usage: python3 host_tool.py [port] <firmware.elf>")
        sys.exit(1)

    image = build_image(elf_path)
    if not image:
        print("Error: Could not build image.")
        sys.exit(1)

    print(f"Connecting to {port}...")
    try:
        ser = serial.Serial(port, 19200, timeout=5)
    except Exception as e:
        print(f"Failed to open port: {e}")
        sys.exit(1)

    print("Stateless Host Tool running. Waiting for MCU requests...")
    try:
        while True:
            req = ser.read(4)
            if len(req) != 4:
                continue

            offset = struct.unpack("<I", req)[0]

            if offset == 0xFFFFFFFF:
                print("\n Firmware update successful! MCU is booting application...")
                break

            if offset == 0xDEADBEEF:
                print("\n CRC FAILED!")
                break

            if offset < len(image):
                chunk = image[offset : offset + 4]
                ser.write(chunk)
                print(
                    f"MCU requested offset: {offset}/{len(image)} (0x{offset:08X})",
                    end="\r",
                )
            else:
                ser.write(b"\xff\xff\xff\xff")
    except KeyboardInterrupt:
        print("\nAborted by user.")
        sys.exit(1)


if __name__ == "__main__":
    main()
