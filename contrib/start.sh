#!/bin/bash
# set -x
DIR=~/tor-proxy

TOR_NODE="$1"

if [ -z "$1" ] || [ "$1" = "decode02" ]; then
  TOR_NODE="dszj4sila655fk3s.onion"
fi

if [ "$1" = "decode03" ]; then
  TOR_NODE="w454lnckcbqrfmpx.onion"
fi

docker rm --force tor-proxy

rm -rf ${DIR}
mkdir -p ${DIR}

git clone https://github.com/DECODEproject/tor-proxy ${DIR}

cd ${DIR}

docker build -t tor-proxy .

docker run \
    --detach \
    --restart=on-failure:3 \
    -e TOR_NODE=${TOR_NODE} \
    -p 9090:80 \
    --name tor-proxy \
    tor-proxy

docker system prune --force --volumes
