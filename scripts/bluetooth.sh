#!/bin/bash
set -e

# This script is used to access
# Use bluetooth in OpI IoT 2G
# manual: http://surfero.blogspot.com.es/2017/06/orange-pi-2g-iot-bluetooth-21-howto.html

whiptail --title "Conexion Bluetooth Opi IoT 2G - surfero75" --msgbox \
 "Voy a lanzar el driver bt_init y  activar el puerto /dev/ttyS1 para bluetooth \
  despues lanzo el software bluez-tool \
  Mas instrucciones en: https://goo.gl/S7ftjg" \
            15 50 0

bt_init
hciattach -s 921600 /dev/ttyS1 any 921600 flow
bluetoothctl

