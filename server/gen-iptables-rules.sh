#!/usr/bin/bash
# Перенаправляем UDP порты для Hysteria2 port hopping на UDP 443
iptables -t nat -A PREROUTING -p udp --dport 20000:30000 -j REDIRECT --to-ports 443
