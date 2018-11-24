#!/usr/bin/env bash

if pgrep -x "keosd" > /dev/null
then
    echo "keosd have been running already"
else
    keosd --data-dir ./ --config-dir ./eosio-wallet &
fi

function ec() {
  cleos --wallet-url http://127.0.0.1:8889 "$@"
}

ec wallet open
ec wallet unlock --password PW5KL9tfYMyeLSwyrZrVsMwFzWKZGp5Eq6PynoZg9Q2RSfXfR4c13

sleep 1
