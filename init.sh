#!/bin/bash

echo "Container startup"

# kill daemons in case of restart
wg-quick down /etc/wireguard/awg0.conf

/bin/update_peers.sh &

# start daemons if configured
if [ -f /etc/wireguard/awg0.conf ]; then (wg-quick up /etc/wireguard/awg0.conf); fi

tail -f /dev/null
