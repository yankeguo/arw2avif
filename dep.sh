#!/bin/bash

set -eu

# Versions (easy to update)
RAWTHERAPEE_VERSION="5.12"
EXIFTOOL_VERSION="13.43"

# URLs
RAWTHERAPEE_URL="https://rawtherapee.com/shared/builds/linux/RawTherapee_${RAWTHERAPEE_VERSION}_release.AppImage"
EXIFTOOL_URL="https://github.com/exiftool/exiftool/archive/refs/tags/${EXIFTOOL_VERSION}.tar.gz"

# Cleanup function
cleanup() {
    rm -f rawtherapee.AppImage exiftool.tar.gz
    rm -rf squashfs-root
}
trap cleanup EXIT

echo "Downloading dependencies..."

# Download in parallel
curl -sSLo rawtherapee.AppImage "$RAWTHERAPEE_URL" &
curl -sSLo exiftool.tar.gz "$EXIFTOOL_URL" &
wait

# Extract RawTherapee
echo "Extracting RawTherapee ${RAWTHERAPEE_VERSION}..."
chmod +x rawtherapee.AppImage
./rawtherapee.AppImage --appimage-extract >/dev/null
rm -rf rawtherapee
mv squashfs-root rawtherapee

# Extract exiftool
echo "Extracting exiftool ${EXIFTOOL_VERSION}..."
tar -xzf exiftool.tar.gz
rm -rf exiftool
mv "exiftool-${EXIFTOOL_VERSION}" exiftool

echo "Done."
