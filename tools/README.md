# Tools Setup

This folder is meant to hold local vendor and helper tools for CH32X035 bring-up.

## MRS Toolchain

The project expects the WCH/MounRiver Linux x64 package to be extracted here:

```text
tools/MRS_Toolchain_Linux_x64_V1.92/
```

After extracting the archive, run:

```bash
cd tools/MRS_Toolchain_Linux_x64_V1.92/beforeinstall
sudo ./start.sh
sudo udevadm control --reload-rules
sudo udevadm trigger
```

## Wlink

[`wlink`](https://github.com/ch32-rs/wlink) is a command-line utility for WCH-Link probes.
It is useful for checking probe state, flashing firmware, and confirming that the probe is in the right mode for CH32X035 work.

Install it locally with Cargo:

```bash
cargo install --git https://github.com/ch32-rs/wlink --root tools/wlink
```

That creates a local `tools/wlink/bin/wlink` binary you can use without putting it in your global Cargo install.

Add it to `PATH` for the current shell session:

```bash
export PATH="$PWD/tools/wlink/bin:$PATH"
wlink --help
```

Useful commands:

```bash
wlink --help
```

Switch to RV mode:
```bash
wlink mode-switch --rv
```

Notes:

- `wlink` supports CH32X035 and WCH-Link / WCH-LinkE probes.
- It can be a helpful fallback when OpenOCD cannot open the probe.
- On Linux, you may need `libudev-dev` and `libusb-1.0-0-dev` installed before running `cargo install`.
