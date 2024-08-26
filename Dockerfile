FROM alpine:latest

RUN apk update && apk add --no-cache bash openrc iptables iptables-legacy iproute2 inotify-tools dumb-init
COPY --chmod=700 --chown=root:root ./awg0.conf /etc/wireguard/awg0.conf
COPY --chmod=755 --chown=root:root ./init.sh /bin/init.sh
COPY --chmod=755 --chown=root:root ./update_peers.sh /bin/update_peers.sh
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wireguard-go /usr/bin/wireguard-go
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wg-quick /usr/bin/wg-quick
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wg /usr/bin/wg

ENTRYPOINT [ "dumb-init", "/bin/init.sh" ]
CMD [ "" ]
