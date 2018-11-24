#!/usr/bin/env bash
echo "start wallet service ..."

if pgrep -x "keosd" > /dev/null; then
    echo "keosd have been running already"
else
    log_file="./logs/start_keosd.log"
    keosd --data-dir ./ --config-dir ./eosio-wallet 3>&1 1>$log_file 2>&1 &
    echo "log-file: $log_file"
fi

function ec() {
  cleos --wallet-url http://127.0.0.1:8889 "$@"
}

sleep 1
ec wallet open
ec wallet unlock --password PW5KL9tfYMyeLSwyrZrVsMwFzWKZGp5Eq6PynoZg9Q2RSfXfR4c13
echo "start wallet service ... === DONE"
echo
echo
