# Sven Co-Op Docker Server

docker run -ti -e SRCDS_MAP=hl_c00 -e SRCDS_LAN=0 -e SRCDS_PW='' -p 27015:27015 -p 27015:27015/udp lanopsdev/gameserver-svencoop