#!/bin/bash

cd /home/steam/sven

# Run Server

/home/steam/steamcmd/steamcmd.sh +login anonymous       \
        +force_install_dir ${SRCDS_SRV_DIR}             \
        +app_update ${SRCDS_APP_ID} validate            \
        +quit
./svends_run                                            \
    -console                                            \
    -autoupdate                                         \
    -steam_dir /home/steam/steamcmd/                    \
    -steamcmd_script /home/steam/sven_update.txt   \
    -port ${SRCDS_PORT}                                 \
    -num_edicts 3072                                    \
    -nohltv                                             \
    +sv_pure ${SRCDS_PURE}                              \
    +maxplayers ${SRCDS_MAXPLAYERS}                     \
    +hostname "${SRCDS_HOSTNAME}"                       \
    +sv_password ${SRCDS_PW}                            \
    +rcon_password ${SRCDS_RCONPW}                      \
    sv_region ${SRCDS_REGION}                           \
    +sv_lan ${SRCDS_LAN}                                \
    +sv_setsteamaccount ${SRCDS_TOKEN}                  \
    +map ${SRCDS_MAP}
