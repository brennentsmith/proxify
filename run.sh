#!/bin/bash

function proxify_usage {
    echo "Proxify - Simple L7 Proxy for handling webapp development"
    echo ""
    echo "Proxies requests to 0.0.0.0 via http and https to a specified backend."
    echo "usage: run.sh [backend_hostname_or_ip:port]"
    echo "   ex: run.sh localhost:6379"
    echo "   ex: run.sh 8.8.8.8"
    echo ""
    echo "provides following headers to backend:"
    echo "  X-Forwarded-For"
    echo "  X-Forwarded-Port"
    echo "  X-Forwarded-Proto (if https)"
}

function proxify_main {
    echo "Proxying $1 to http://localhost and https://localhost"
    eval $(which docker) run -e "BACKEND=$1" -it -p 7080:7080 -p 80:80 -p 443:443 proxify:latest
    eval $(which docker) ps -a | awk '{ print $1,$2 }' | grep proxify:latest | awk '{print $1 }' | xargs -I {} docker rm {} > /dev/null
    echo ""
    echo "Farewell, lone traveler..."
}

if [ $# -eq 0 ]
  then
    proxify_usage
    exit 1
fi

proxify_main $1
