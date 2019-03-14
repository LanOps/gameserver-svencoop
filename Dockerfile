FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (Th0rn0@lanops.co.uk)

# Env Defaults
ENV SRCDS_HOSTNAME default
ENV SRCDS_PORT 27015 
ENV SRCDS_MAXPLAYERS 8 
ENV SRCDS_TOKEN 0 
ENV SRCDS_RCONPW default 
ENV SRCDS_REGION -1
ENV SRCDS_PURE 1
ENV SRCDS_MAP hl_c00
ENV SRCDS_LAN 0
ENV APP_ID 276060

# Add Start Script
RUN mkdir -p /home/steam/sven 
RUN { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir /home/steam/sven/'; \
        echo 'app_update $APP_ID'; \
        echo 'quit'; \
} > /home/steam/sven_update.txt

# Add Start Script
ADD resources/root/startServer.sh /home/steam/startServer.sh

# Expose Ports
EXPOSE ${SRCDS_PORT}
EXPOSE ${SRCDS_PORT}/udp

# Start Server
CMD ["/home/steam/startServer.sh"]