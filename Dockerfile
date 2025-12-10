FROM debian:13

LABEL org.opencontainers.image.source="https://github.com/yankeguo/arw2avif"
LABEL org.opencontainers.image.description="Convert Sony ARW RAW files to AVIF format for archival purposes"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update && \
    apt-get install -y libexpat1 ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD rawtherapee /opt/rawtherapee

ADD exiftool /opt/exiftool

ADD bin/ /usr/local/bin/