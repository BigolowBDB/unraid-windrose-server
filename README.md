# Windrose Dedicated Server - Docker / Unraid

A Docker image for running a Windrose dedicated server on Unraid or any other system running Docker.

## Features

- Runs the Windrose dedicated server via Wine on Linux
- Server files are included - no Steam account required
- Saves stored persistently on your host
- Auto-restarts if the server crashes

## Requirements

- Docker
- At least 16 GB RAM
- At least 35 GB free disk space

## Unraid Installation

1. Download the template XML:
```
https://raw.githubusercontent.com/BigolowBDB/unraid-windrose-server/main/windrose-server.xml
```
2. Copy it to `/boot/config/plugins/dockerMan/templates-user/` on your Unraid
3. Go to **Docker → Add Container → Template → Windrose-Server**
4. Set your server name and click Apply

## Docker Installation

```bash
docker run -d \
  --name Windrose Docker \
  --network bridge \
  --restart unless-stopped \
  -v /your/path/server:/windrose/server \
  -v /your/path/saves:/windrose/server/R5/Saved \
  bigolow/windrose-server:latest
```

## Server Configuration

Edit `ServerDescription.json` in your server folder to configure:
- `InviteCode` - The code players use to join
- `ServerName` - Display name
- `IsPasswordProtected` - true/false
- `Password` - Server password
- `MaxPlayerCount` - Max players (recommended: 4)

## Connecting

In Windrose: **Play → Connect to Server** → Enter your invite code

## Notes

- The server requires an active internet connection to register with the Windrose backend
- If the internet connection drops, the server will crash and restart automatically
- Built and tested on release day (April 14, 2026)

## Links

- [Windrose on Steam](https://store.steampowered.com/app/3041230/Windrose/)
