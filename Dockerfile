FROM alpine:latest

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.name="mcf.io rtorrent client" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.url="https://github.com/rakshasa/rtorrent/wiki" \
  org.label-schema.vcs-url="https://github.com/mcfio/docker-rtorrent.git" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vendor="mcf.io" \
  org.label-schema.docker.cmd="docker run -d -p 64738:64738 -p 64738:64738/udp -v <data dir>:/data mcfio/rtorrent-client"

WORKDIR /config

RUN apk add --no-cache \
    rtorrent

COPY defaults/ /defaults
COPY docker-entrypoint.sh /usr/local/bin

EXPOSE 49164 6881

VOLUME ["/data", "/config"]

ENTRYPOINT ["docker-entrypoint.sh"]
