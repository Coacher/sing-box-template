Requires sing-box 1.14.0 or later.

Create sing-box server and client configs with:

```bash
cd server/hysteria2 && bash gen-hysteria2-cert.sh && cd -
bash gen-config.sh <PRIVATE_SERVER_IPv4_ADDRESS>
```

Configure your private server with:

```bash
# This command must be executed on your private server
cd server && bash gen-iptables-rules.sh && cd -
```
