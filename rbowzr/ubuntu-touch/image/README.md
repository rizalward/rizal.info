# ЯBOWZR standalone Ubuntu Touch image

This directory defines the reproducible Google Pixel 3a (`sargo`) flash-bundle
build. It is separate from the content-only face updater.

The bundle is pinned to verified auto-update payload `0.1.0-ut3`. The builder
downloads the immutable release path and checks size and SHA-256 before
embedding it. It refuses to build if any required device image is missing.

A complete flashable Ubuntu Touch image requires device-specific `boot.img`,
`halium-boot.img`, `system.img`, `vendor.img`, and the Ubuntu Touch rootfs.
Those are not interchangeable with the face package and are not currently
stored in this GitHub repository.

Run on a Linux build host:

```sh
./build-standalone-bundle.sh /path/to/pixel3a-inputs ./dist
```

The retained Android 9 factory archive can prepare the compatible stock
pieces with `prepare-pixel3a-inputs.sh`; the script deliberately leaves the
Halium boot image and Ubuntu rootfs as explicit build outputs.

The script creates a compressed flash bundle and checksum but does not flash a
phone. Device source reference:
https://gitlab.com/ubports/porting/reference-device-ports/android9/google-pixel-3a
