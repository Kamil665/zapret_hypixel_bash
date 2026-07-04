#!/bin/bash

PROXY_LIST="proxies.txt"
MINECRAFT_LAUNCHER="/path/to/minecraft-launcher"
JAVA_OPTS="-Dhttp.proxyHost=... -Dhttp.proxyPort=..."

check_proxy() {
    local proxy=$1
    # Test the proxy by making a simple request
    curl -x "socks5://$proxy" -m 10 -I https://mc.hypixel.net || return 1
    return 0
}

bypass_hypixel() {
    while IFS= read -r proxy; do
        [[ -z "$proxy" ]] && continue
        if check_proxy "$proxy"; then
            echo "[+] Прокси $proxy работает. Запускаем Minecraft..."
            proxychains -q "$MINECRAFT_LAUNCHER" --proxy "$proxy" &

            wait $!
            echo "[+] Сессия завершена."
            return 0
        else
            echo "[-] Прокси $proxy не работает. Пробуем следующий..."
        fi
    done < "$PROXY_LIST"

    echo "[-] Все прокси неработоспособны."
}

echo "=== Bash Hypixel Bypass (псевдо) ==="
bypass_hypixel