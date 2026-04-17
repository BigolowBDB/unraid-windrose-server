#!/bin/bash
export HOME=/tmp/steamhome
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p /tmp/steamhome /tmp/runtime-root
chmod 700 /tmp/runtime-root

echo "=== Prüfe auf Updates... ==="
/home/steam/steamcmd/steamcmd.sh \
    +@sSteamCmdForcePlatformType windows \
    +@ShutdownOnFailedCommand 0 \
    +force_install_dir /windrose/server \
    +login anonymous \
    +app_update 4129620 \
    +quit
echo "=== Update-Check abgeschlossen ==="

pkill Xvfb 2>/dev/null || true
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null || true
Xvfb :1 -screen 0 1024x768x16 &
sleep 5
export DISPLAY=:1

cd /windrose/server
exec wine R5/Binaries/Win64/WindroseServer-Win64-Shipping.exe -log
