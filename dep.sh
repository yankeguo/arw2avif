#!/bin/bash

set -eu

curl -sSLo rawtherapee.AppImage 'https://rawtherapee.com/shared/builds/linux/RawTherapee_5.12_release.AppImage'

chmod +x rawtherapee.AppImage

./rawtherapee.AppImage --appimage-extract

rm rawtherapee.AppImage

mv squashfs-root rawtherapee

curl -sSLo exiftool.tar.gz 'https://github.com/exiftool/exiftool/archive/refs/tags/13.43.tar.gz'

tar -xzf exiftool.tar.gz

mv exiftool-13.43 exiftool

rm exiftool.tar.gz