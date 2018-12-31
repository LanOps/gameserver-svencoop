FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (Th0rn0@lanops.co.uk)

# Env Defaults
ENV SRCDS_HOSTNAME default
ENV SRCDS_PORT 27015 
ENV SRCDS_MAXPLAYERS 8 
ENV SRCDS_TOKEN 0 
ENV SRCDS_RCONPW default 
ENV SRCDS_PW default
ENV SRCDS_REGION -1
ENV SRCDS_PURE 1
ENV SRCDS_MAP hl_c00
ENV APP_ID 276060

# Install TF2
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous \
        +force_install_dir /home/steam/sven \
        +app_update $APP_ID validate \
        +quit

RUN { \
		echo '@ShutdownOnFailedCommand 1'; \
		echo '@NoPromptForPassword 1'; \
		echo 'login anonymous'; \
		echo 'force_install_dir /home/steam/sven/'; \
		echo 'app_update $APP_ID'; \
		echo 'quit'; \
} > /home/steam/sven/sven_update.txt

# Add Start Script
ADD startServer.sh /home/steam/startServer.sh

# Expose Ports
EXPOSE 27015 27020 27005 51840
EXPOSE 27015/udp

# Start Server
CMD ["/home/steam/startServer.sh"]

