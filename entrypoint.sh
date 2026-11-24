#!/bin/sh
# Railway 会注入 $PORT，xray 配置里用 $PORT 替换 8080
PORT=${PORT:-8080}
sed -i "s/\"port\":[[:space:]]*8080/\"port\": $PORT/" /etc/xray/config.json
echo "Starting xray on port $PORT, ws path /ray"
exec /usr/bin/xray run -config /etc/xray/config.json
