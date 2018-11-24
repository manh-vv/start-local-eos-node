#!/usr/bin/env bash

# start wallet service
bash ./start_keosd.sh

# start genesis node
source ./utils.sh

data_dir=node10
start_node $data_dir eosio 8880 8890

echo "execute command [$R_COMMAND]"
$R_COMMAND 3>&1 1>./logs/$data_dir.log 2>&1 &

sleep 5

# setup bp
bash ./setup_bp.sh