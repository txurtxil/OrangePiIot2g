#!/bin/bash
set -e

# This script is used to access
# your PC via GPRS / 3G  without public ip
# manual: http://surfero.blogspot.com.es/2017/05/conexion-por-red-de-datos-movil-2g-g.html

FWD_PORT=1234
WAIT_SECONDS=60
REMOTE_ADDRESS=$1
REMOTE_PORT=$2
PASSWORD=$3

# By default the tunnel never seems to timeout. This is bad because if the connection to the
# server has been established once, then the server disconnects (link down, or maybe it's a laptop
# that doesn't run 24/7), it could never be re-established. So it's important to set a timeout for
# the tunnel. Note that keepalive is handled transparently by ssh; it does not mean any payload data
# has to be sent through the tunnel at these intervals.

SERVER_ALIVE_INTERVAL=60
SERVER_ALIVE_COUNT_MAX=2
	
while true; do
 REMOTE_ADDRESS=$(whiptail --inputbox "IP publica remota" 8 78 --title "Conexion ssh inverso" 3>&1 1>&2 2>&3)
 REMOTE_PORT=$(whiptail --inputbox "Introduce el puerto de tu srv ssh " 8 78 --title "Conexion ssh inverso" 3>&1 1>&2 2>&3)
 PASSWORD=$(whiptail --inputbox "Introduce la PASSWORD de tu srv ssh " 8 78 --title "Conexion ssh inverso" 3>&1 1>&2 2>&3)	 
  sshpass -p "$PASSWORD" \
  ssh -o ServerAliveInterval=$SERVER_ALIVE_INTERVAL \
      -o ServerAliveCountMax=$SERVER_ALIVE_COUNT_MAX \
      -o StrictHostKeyChecking=no \
      -o UserKnownHostsFile=/dev/null \
      -o ConnectTimeout=15 \
      -N -R $FWD_PORT:localhost:22 $REMOTE_ADDRESS -p $REMOTE_PORT
      sleep $WAIT_SECONDS
done

