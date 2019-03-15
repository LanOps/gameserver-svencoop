FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (Th0rn0@lanops.co.uk)

# Env - Defaults
ENV SRCDS_HOSTNAME default
ENV SRCDS_PORT 27015 
ENV SRCDS_MAXPLAYERS 8 
ENV SRCDS_RCONPW rconpass 
ENV SRCDS_REGION -1
ENV SRCDS_PURE 1
ENV SRCDS_MAP hl_c00
ENV SRCDS_LAN 0

# Env - Server

ENV SRCDS_SRV_DIR /home/steam/sven
ENV SRCDS_APP_ID 276060

# Add Start Script

RUN mkdir -p ${SRCDS_SRV_DIR} 
RUN { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir $SRCDS_SRV_DIR'; \
        echo 'app_update $SRCDS_APP_ID'; \
        echo 'quit'; \
} > /home/steam/sven_update.txt

# Add Start Script

ADD resources/root/startServer.sh /home/steam/startServer.sh

# Expose Ports

EXPOSE ${SRCDS_PORT}
EXPOSE ${SRCDS_PORT}/udp
EXPOSE 27020 27005 51840

# Start Server

CMD ["/home/steam/startServer.sh"]