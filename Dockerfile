FROM debian:13

RUN apt-get update && \
    apt-get install -y libexpat1 ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD rawtherapee /opt/rawtherapee

ADD exiftool /opt/exiftool

ENV PATH="/opt/bin:$PATH"

ADD bin/ /opt/bin/
