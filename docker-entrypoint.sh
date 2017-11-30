#!/usr/bin/env sh
set -e

[[ ! -e /root/.rtorrent.rc ]] && \
    cp /defaults/rtorrent.rc /root/.rtorrent.rc

[[ ! -e /config/config.d ]] && \
    mkdir -p /config/config.d

[[ ! -e /config/config.d/default.rc ]] && \
    cp /defaults/config.d/default.rc /config/config.d/default.rc

exec /usr/bin/rtorrent
