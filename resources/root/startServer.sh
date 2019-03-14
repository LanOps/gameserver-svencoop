#!/bin/sh

cd /home/steam/sven
/home/steam/steamcmd/steamcmd.sh +login anonymous   \
        +force_install_dir /home/steam/sven          \
        +app_update ${APP_ID} validate              \
        +quit
./svends_run \
    -console \
    -autoupdate \
    -steam_dir /home/steam/steamcmd/ \
    -steamcmd_script /home/steam/sven/sven_update.txt \
    -port ${SRCDS_PORT} \
    -num_edicts 3072 \
    -nohltv \
    +sv_pure ${SRCDS_PURE} \
    +maxplayers ${SRCDS_MAXPLAYERS} \
    +hostname "${SRCDS_HOSTNAME}" \
    +sv_password ${SRCDS_PW} \
    +rcon_password ${SRCDS_RCONPW} \
    sv_region ${SRCDS_REGION} \
    +sv_lan "${SRCDS_LAN}" \
    +map ${SRCDS_MAP}
