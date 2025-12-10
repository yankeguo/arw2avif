# arw2avif

Convert Sony ARW RAW files to AVIF format for archival purposes.

## Usage

Pull the Docker image:

```bash
docker pull ghcr.io/yankeguo/arw2avif:latest
```

Run the conversion:

```bash
docker run --rm \
    -v /path/to/your/photos:/data \
    ghcr.io/yankeguo/arw2avif:latest \
    arw2avif /data/DSC00001.ARW /data/DSC00002.ARW
```

If you encounter permission issues with the output files, use the `-u` flag to match your user:

```bash
docker run --rm \
    -u $(id -u):$(id -g) \
    -v /path/to/your/photos:/data \
    ghcr.io/yankeguo/arw2avif:latest \
    arw2avif /data/DSC00001.ARW /data/DSC00002.ARW
```

## What It Does

The conversion pipeline:

1. **ARW → TIF**: Uses RawTherapee with neutral processing (`-t -b16`) to convert RAW to 16-bit TIFF, preserving maximum dynamic range
2. **TIF → AVIF**: Uses FFmpeg with libaom-av1 encoder (CRF 4, YUV 4:2:2 12-bit) for near-lossless compression
3. **EXIF Transfer**: Copies all metadata from the original ARW to the output AVIF using ExifTool
4. **Cleanup**: Removes intermediate TIFF file

Output AVIF files are created in the same directory as the input files.

## License

MIT
