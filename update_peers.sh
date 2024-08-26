#!/bin/bash

CONFIG_FILE="/etc/wireguard/awg0.conf"
INTERFACE="awg0"
LOGFILE="/var/log/wireguard-update.log"

inotifywait -m -e modify "$CONFIG_FILE" | while read -r; do
    echo "Detected change in $CONFIG_FILE. Reloading interface..." | tee -a $LOGFILE

    wg-quick down $INTERFACE
    wg-quick up $INTERFACE

    echo "Interface reloaded successfully." | tee -a $LOGFILE
done
