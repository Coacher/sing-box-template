#!/usr/bin/bash
# Перенаправляем UDP порты для Hysteria2 port hopping на UDP 443
iptables -t nat -A PREROUTING -p udp --dport 40000:44999 -j REDIRECT --to-ports 443
iptables -t nat -A PREROUTING -p udp --dport 45000:49999 -j REDIRECT --to-ports 8443
