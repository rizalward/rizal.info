#!/bin/sh
set -eu

FACTORY_ZIP=${1:?usage: $0 PIXEL_FACTORY_IMAGE_ZIP OUTPUT_DIR}
OUTPUT=${2:?usage: $0 PIXEL_FACTORY_IMAGE_ZIP OUTPUT_DIR}
test -f "$FACTORY_ZIP" || { echo "factory image not found: $FACTORY_ZIP" >&2; exit 2; }
command -v unzip >/dev/null 2>&1 || { echo "unzip is required" >&2; exit 2; }
mkdir -p "$OUTPUT"

for name in boot.img system.img vendor.img; do
  unzip -p "$FACTORY_ZIP" "$name" > "$OUTPUT/$name"
  test -s "$OUTPUT/$name" || { echo "factory archive did not contain $name" >&2; exit 3; }
done

cat >&2 <<EOF
Extracted compatible Android 9 stock inputs into $OUTPUT.

Still required before publishing a standalone Ubuntu Touch bundle:
  $OUTPUT/halium-boot.img
  $OUTPUT/ubuntu-touch-rootfs.img

Do not rename the stock boot image to halium-boot.img. The Halium image must
be built for sargo from the matching port source.
EOF
