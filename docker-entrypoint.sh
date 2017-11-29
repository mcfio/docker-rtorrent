#!/usr/bin/env sh
set -e

[[ ! -e /root/.rtorrent.rc ]] && cp /defaults/rtorrent.rc /root/.rtorrent.rc

if [ ! -e /config/config.d ]; then
    mkdir -p /config/config.d
    cp /defaults/config.d/default.rc /config/config.d/default.rc
fi

exec /usr/bin/rtorrent
