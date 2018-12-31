# Sven Co-op Docker Server

## Usage

```
docker run --name "SvenCoop" \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_PORT=27015 \
    -e SRCDS_MAP=hl_c00 \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_LAN=0 \
    -e SRCDS_PW=default \
    -e SRCDS_RCONPW=default \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-svencoop
```

### For Persistance mount the /home/steam/sven directory

```
docker run --name "SvenCoop" \
    -v localVolume:/home/steam/sven \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_PORT=27015 \
    -e SRCDS_MAP=hl_c00 \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_TOKEN=xxx \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-svencoop
```


## Environment Variables

* SRCDS_PORT - Port Number for the server to run on (Default 27015)
* SRCDS_PURE - Set the pure level of the server (Default 1)
* SRCDS_MAXPLAYERS - Max number of players (Default 14)
* SRCDS_HOSTNAME - Server Name (Default myServer)
* SRCDS_PW - Password for access to the server (Default password)
* SRCDS_RCONPW - Password for RCON (Default rconpass)
* SRCDS_REGION - Server Region (Default -1)
* SRCDS_LAN - Set Lan Server (Default 0)
* SRCDS_MAP - Starting Map (Default hl_c00)