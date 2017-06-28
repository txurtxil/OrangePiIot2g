#!/bin/bash
set -e

# This script is used to build OrangePi system
# Write: surfero75
# Date:  2017-06-28

whiptail --title "OrangePi IoT 2G config menu - surfero75" --msgbox \
 "`figlet OrangePi` Script for manage and configure Orange Pi IoT 2G more info: surfero.blogspot.com" \
          15 50 0

MENUSTR="Plase select option"

#El tamano de la ventana viene definido por 20 50 8
OPTION=$(whiptail --title "Opi IoT 2G config system - surfero75" \
    --menu "$MENUSTR" 20 50 8 --cancel-button Finish --ok-button Select \
    "0"   "Configure WiFi" \
    "1"   "Connect GPRS" \
    "2"   "SSH inverso" \
    "3"   "Use Bluetooth" \
    "4"   "Shell & tmux" \
    "5"    "htop" \
    3>&1 1>&2 2>&3)

#Bucle principal, insertar las llamadas a los scripts
if [ $OPTION = "0" ]; then
    # Configure wifI
       /usr/bin/OrangePi_Settings
    elif [ $OPTION = "1" ]; then
        /usr/bin/wvdial &
    elif [ $OPTION = "2" ]; then
        echo "SSh Inverso"
    elif [ $OPTION = "3" ]; then
        echo "Use Bluetooth"
    elif [ $OPTION = "4" ]; then
        tmux new -s ventana1 
else
        echo "Bad Operation"
fi

