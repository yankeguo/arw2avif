FROM debian:13

RUN apt-get update && \
    apt-get install -y libexpat1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD rawtherapee /opt/rawtherapee

ENV PATH="/opt/rawtherapee/usr/bin:$PATH"
