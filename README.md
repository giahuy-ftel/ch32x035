# CH32X035 Setup Guide

This repository is a bare-metal bring-up project for the WCH CH32X035 family.
It is meant to give you a known-good starting point for:

- building the firmware
- flashing the board with OpenOCD
- printing a startup message over USART2
- blinking the PB12 LED in a simple loop

## Project Layout

- `sources/application/` - application entry point
- `sources/platform/` - console setup and `xprintf`
- `sources/device/` - startup code, linker script, and peripheral drivers
- `tools/` - local copy of the WCH/MounRiver toolchain

## Toolchain Setup

Install the MRS toolchain by downloading the Linux x64 package from WCH/MounRiver and extracting it into the local `tools/` folder.

If the main download page is hard to open in your browser, use the GitHub-hosted mirror release instead:

```bash
wget https://github.com/ch32-riscv-ug/MounRiver_Studio_Community_miror/releases/download/1.92-toolchain/MRS_Toolchain_Linux_x64_V1.92.tar.xz
```

After downloading, extract it into `tools/`:

```bash
tar -xf MRS_Toolchain_Linux_x64_V1.92.tar.xz -C tools/
```

Then run the installer helper that comes with the package:

```bash
cd tools/MRS_Toolchain_Linux_x64_V1.92/beforeinstall
sudo ./start.sh
sudo udevadm control --reload-rules
sudo udevadm trigger
```

Basic setup:

1. Create a `tools/` folder in the repository root if it does not already exist.
2. Download the MRS Linux x64 toolchain archive.
3. Extract the archive into `tools/`.
4. Run `tools/MRS_Toolchain_Linux_x64_V1.92/beforeinstall/start.sh`.
5. Reload and trigger `udev` so the WCH rules take effect.
6. Rename the extracted folder to `MRS_Toolchain_Linux_x64_V1.92.1` or `MRS_Toolchain_Linux_x64_V1.92` if needed, or update `Makefile` to match the extracted folder name.
7. Confirm the final layout matches the paths below.

Expected layout:

```text
tools/
  MRS_Toolchain_Linux_x64_V1.92.1/
    RISC-V_Embedded_GCC/
    OpenOCD/
```

The Makefile will use `tools/MRS_Toolchain_Linux_x64_V1.92.1/` first, then fall back to `tools/MRS_Toolchain_Linux_x64_V1.92/`.

The Makefile expects these files to exist:

- `tools/MRS_Toolchain_Linux_x64_V1.92.1/RISC-V_Embedded_GCC/bin/riscv-none-embed-gcc`
- `tools/MRS_Toolchain_Linux_x64_V1.92.1/OpenOCD/bin/openocd`
- `tools/MRS_Toolchain_Linux_x64_V1.92.1/OpenOCD/bin/wch-riscv.cfg`

If your toolchain folder name is different, either rename it to match one of the paths above or update `GCC_PATH`, `OPENOCD_PATH`, and `TARGET_CFG_PATH` in [Makefile](/workspace-256GB/CH32x035/Makefile).

If you need the OpenOCD source or want to rebuild it yourself, this fork is the one used for CH32V support:

- [kprasadvnsi/riscv-openocd-wch](https://github.com/kprasadvnsi/riscv-openocd-wch)

The MRS package already ships an OpenOCD binary, so most bring-up flows can just use the copy under `tools/MRS_Toolchain_Linux_x64_V1.92.1/OpenOCD/`.

## Build

From the project root:

```bash
make
```

This generates:

- `build_CH32x035_Sample/CH32x035_Sample.elf`
- `build_CH32x035_Sample/CH32x035_Sample.bin`
- `build_CH32x035_Sample/CH32x035_Sample.hex`
- `build_CH32x035_Sample/CH32x035_Sample.asm`

## Flash

Program the board with:

```bash
make flash
```

This target expects a connected WCH debug probe supported by the bundled OpenOCD config.
The file [tools/MRS_Toolchain_Linux_x64_V1.92/OpenOCD/bin/wch-riscv.cfg](tools/MRS_Toolchain_Linux_x64_V1.92/OpenOCD/bin/wch-riscv.cfg) uses `adapter driver wlinke` and `transport select sdi`, so the probe must be visible to OpenOCD before flashing will work.
The bundled toolchain docs also run OpenOCD with `sudo`, so the Makefile now does the same for the flash/debug targets.
When things are working, OpenOCD prints `WCH-LinkE mode:RV` and `wlink_init ok` before programming starts.

If you are using a plain `WCH-Link` probe, make sure it is in RISC-V mode.
WCH documents that the probe can be switched by holding `TX` to `GND` while plugging in the probe, then reconnecting it after the mode change.
If the probe firmware is out of date, update it with WCH-LinkUtility or MounRiver Studio before flashing again.
For local probe helpers, see [tools/README.md](/workspace-256GB/CH32x035/tools/README.md).

Other useful targets:

- `make erase`
- `make verify`
- `make reset`
- `make debug`

## Debugger

Source-level debugging uses the same OpenOCD server started by the flash flow.

1. Open one terminal and run:

```bash
make debug
```

2. Open another terminal and connect GDB:

```bash
$(HOME)/tools/MRS_Toolchain_Linux_x64_V1.92/RISC-V_Embedded_GCC12/bin/riscv-none-elf-gdb build_CH32x035_Sample/CH32x035_Sample.elf
```

3. Inside GDB:

```gdb
target remote localhost:3333
load
continue
```

If you want to step through startup code, build with `-g` enabled, which this Makefile already does.
The Cortex-Debug extension needs GDB 9 or newer, so use the `RISC-V_Embedded_GCC12` GDB binary for VS Code debugging.

## VS Code Cortex-Debug

If you prefer debugging from VS Code, install the `Cortex-Debug` extension and use the launch config in [`.vscode/launch.json`](/workspace-256GB/CH32x035/.vscode/launch.json).

Steps:

1. Build the firmware with `make`.
2. Open the Run and Debug panel in VS Code.
3. Select `Cortex Debug (OpenOCD)`.
4. Start debugging.
5. Wait for OpenOCD to connect, then use breakpoints, step, continue, and register views in the editor.

That launch config uses:

- `tools/MRS_Toolchain_Linux_x64_V1.92/OpenOCD/bin/openocd`
- `tools/MRS_Toolchain_Linux_x64_V1.92/OpenOCD/bin/wch-riscv.cfg`
- `tools/MRS_Toolchain_Linux_x64_V1.92/RISC-V_Embedded_GCC12/bin/riscv-none-elf-gdb`

If Cortex-Debug complains about the GDB version, make sure it is using the GCC12 GDB path above.

## Board Bring-Up

The default application:

- configures `PB12` as a push-pull output
- initializes `USART2` at `115200 8N1`
- prints `CH32x035 bare-metal firmware ready`
- toggles the LED and prints `LED toggle`

See [sources/application/main.cpp](/workspace-256GB/CH32x035/sources/application/main.cpp) for the exact startup code.

## Console Wiring

The console is configured in [sources/platform/bsp_cfg.c](/workspace-256GB/CH32x035/sources/platform/bsp_cfg.c).

- USART: `USART2`
- TX pin: `PA2`
- Baud rate: `115200`
- Format: `8 data bits, no parity, 1 stop bit`

Connect MCU TX to the RX pin of your USB-to-serial adapter and share ground.

## Flash Troubleshooting

If `make flash` prints `Error: open failed`:

- check that the WCH debug probe is plugged in and powered
- confirm `lsusb` shows the probe on the host
- confirm you are using the correct OpenOCD config for your probe type
- confirm no other process is holding the probe open
- try unplugging and reconnecting the probe, then run `make flash` again

If `dmesg` shows USB errors like `device descriptor read/64, error -32` or `device not accepting address`, the host is failing to enumerate the probe before OpenOCD can talk to it.

- use a known-good data cable
- plug the probe directly into the PC instead of a hub
- try a different USB port
- power-cycle the probe and reconnect it
- if this is a WCH-LinkE, update its firmware with WCH-LinkUtility before trying again

The bundled OpenOCD config uses the WCH `wlinke` driver and `sdi` transport, so the probe and firmware need to match that flow.

## First Boot Checklist

1. Put the MRS toolchain into `tools/MRS_Toolchain_Linux_x64_V1.92.1/` or `tools/MRS_Toolchain_Linux_x64_V1.92/`.
2. Run `make` to build the firmware.
3. Run `make flash` to program the board.
4. Open a serial terminal at `115200`.
5. Reset the board.
6. Confirm the startup banner and LED toggle messages.

## Notes

- OpenOCD is only used for flashing, erase, verify, and debug targets.
- Flashing uses `sudo` because the bundled WCH OpenOCD flow expects elevated access to the probe.
- A `WCH-Link` probe must be in RISC-V mode for CH32X035 flashing.
- The project no longer depends on AK-mOS.
- The build is intentionally small so it can serve as a clean bring-up baseline.
