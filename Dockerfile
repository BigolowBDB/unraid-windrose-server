FROM cm2network/steamcmd:root

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        wine wine32 wine64 xvfb x11-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /windrose
COPY start.sh /windrose/start.sh
RUN chmod +x /windrose/start.sh

CMD ["/windrose/start.sh"]
