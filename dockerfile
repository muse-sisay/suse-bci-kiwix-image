FROM registry.suse.com/bci/bci-base:latest AS downloader

RUN zypper install -y wget tar gzip

ARG VERSION

WORKDIR /tmp 

# Install kiwix-tools
RUN wget -q -O - http://mirror.download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-x86_64-$VERSION.tar.gz | tar -xz


FROM registry.suse.com/bci/bci-busybox:latest 

ARG VERSION

COPY --from=downloader /tmp/kiwix-tools_linux-x86_64-$VERSION/kiwix-serve /usr/local/bin

# expose kiwix-serve default port
EXPOSE 80

# add execute bit
COPY ./start.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start.sh"]