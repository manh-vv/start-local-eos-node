#!/usr/bin/env bash

# start wallet service
bash ./start_keosd.sh

# start genesis node
source ./utils.sh

data_dir=node10
start_node $data_dir eosio 8880 8890

echo "execute command [$R_COMMAND]"
log_file="./logs/$data_dir.log"
$R_COMMAND 3>&1 1>$log_file 2>&1 &
echo "log-file: $log_file"
echo
echo
sleep 2

# setup bp
echo "setting up genesis node ..."
bash ./setup_bp.sh
echo "setting up genesis node ... === DONE"
echo
echo
