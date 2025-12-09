#!/bin/bash

set -eu

curl -sSLo rawtherapee.AppImage 'https://rawtherapee.com/shared/builds/linux/RawTherapee_5.12_release.AppImage'

chmod +x rawtherapee.AppImage

./rawtherapee.AppImage --appimage-extract

rm rawtherapee.AppImage

mv squashfs-root rawtherapee
