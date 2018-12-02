#!/usr/bin/env bash

# start genesis node
source ./utils.sh

function create_start_bp_cmd {
  assert_agrs_num $# 4

  BLOCK_PRODUCER_NAME=$1

  DATA_DIR=$2
  SERVER_PORT=$3
  PEER_PORT=$4

  start_node $DATA_DIR $BLOCK_PRODUCER_NAME $SERVER_PORT $PEER_PORT
  START_BP_CMD="$R_COMMAND --signature-provider EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc=KEY:5JqfpZngJysPemfhkWU2tT99SmP8uVR9MLzCPxSoT5UoHNpoYKh"
  START_BP_CMD="$START_BP_CMD --p2p-peer-address localhost:$GENESIS_BP_PEER"

  log_file="./logs/$DATA_DIR.log"
  START_BP_CMD="$START_BP_CMD ${@:5:20}"
  # START_BP_CMD="$START_BP_CMD 3>&1 1>$log_file 2>&1 &"
}

system_register_producer accountnum11
system_register_producer accountnum12
system_register_producer accountnum13
system_register_producer accountnum14
system_register_producer accountnum15

echo "---- list out all producers:"
ec_genesis system listproducers

wait_seconds=2
echo "wait $wait_seconds seconds..."
sleep $wait_seconds

system_vote_producer accountnum21 accountnum12 accountnum13
system_vote_producer accountnum22 accountnum11 accountnum13
system_vote_producer accountnum23 accountnum11 accountnum12
system_vote_producer accountnum24 accountnum14 accountnum11
system_vote_producer accountnum25 accountnum15 accountnum11
echo
ec_genesis system listproducers
echo

create_start_bp_cmd accountnum11 node11 8881 8891 "--p2p-peer-address localhost:8892 --p2p-peer-address localhost:8893"
START_BP_CMD_1=$START_BP_CMD

create_start_bp_cmd accountnum12 node12 8882 8892 "--p2p-peer-address localhost:8893 --p2p-peer-address localhost:8891"
START_BP_CMD_2=$START_BP_CMD

create_start_bp_cmd accountnum13 node13 8883 8893 "--p2p-peer-address localhost:8891 --p2p-peer-address localhost:8892"
START_BP_CMD_3=$START_BP_CMD

echo "===== START BP WITH COMMAND IN NEW TERMINAL TAB: ====="
echo
echo $START_BP_CMD_1
echo
echo $START_BP_CMD_2
echo
echo $START_BP_CMD_3
echo

echo "depend on the number of bp are running to add peer parameter"
echo "--p2p-peer-address localhost:$GENESIS_BP_PEER"
echo
echo "to run in background, append to command: 3>&1 1>log_file 2>&1 &"
echo
