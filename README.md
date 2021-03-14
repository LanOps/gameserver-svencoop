# Sven Co-op Docker Image

## Usage

```
docker run -it --name "SvenCoop" \
    -v /path/to/local/m:/home/steam/sven                \
    -p 27015:27015                                      \
    -p 27015:27015/udp                                  \
    lanopsdev/gameserver-svencoop  
```

### For Persistance mount the /home/steam/sven directory

```
docker run -it --name "SvenCoop" \
    -v /path/to/local/m:/home/steam/sven                \
    -p 27015:27015                                      \
    -p 27015:27015/udp                                  \
    lanopsdev/gameserver-svencoop                      \
    +sv_pure ${SRCDS_PURE}                              \
    +maxplayers ${SRCDS_MAXPLAYERS}                     \
    +hostname "${SRCDS_HOSTNAME}"                       \
    +sv_password ${SRCDS_PW}                            \
    +rcon_password ${SRCDS_RCONPW}                      \
    sv_region ${SRCDS_REGION}                           \
    +sv_lan ${SRCDS_LAN}                                \
    +map ${SRCDS_MAP}

```


## Environment Variables

* SRCDS_PORT - Port Number for the server to run on (Default 27015)
