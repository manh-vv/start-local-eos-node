#!/usr/bin/env bash

# start wallet service
bash ./start_keosd.sh

# start genesis node
source ./utils.sh
# clean log
echo "" > $utils_log_file

data_dir=node10
start_node $data_dir $GENESIS_BP_NAME $GENESIS_BP_PORT $GENESIS_BP_PEER \
  "--p2p-peer-address localhost:8891 --p2p-peer-address localhost:8892 --p2p-peer-address localhost:8893"

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
