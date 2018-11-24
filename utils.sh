#!/usr/bin/env bash

# make log foler 
if [ ! -d "./logs" ]; then
  echo "make directory [./logs]"
  mkdir ./logs
fi

function assert_agrs_num {
  ACTUAL=$1
  EXPECTED=$2

  if [ $ACTUAL -lt $EXPECTED ]; then
    echo "Illegal number of parameters"
    return 1
  fi
}

function start_node {
  assert_agrs_num $# 4
  
  DATA_DIR=$1
  BP_NAME=$2
  SERVER_PORT=$3
  PEER_PORT=$4
  
  R_COMMAND="nodeos -e -p $BP_NAME"
  R_COMMAND="$R_COMMAND --genesis-json ./genesis.json"
  R_COMMAND="$R_COMMAND --data-dir ./$DATA_DIR"
  R_COMMAND="$R_COMMAND --config-dir ./config"
  R_COMMAND="$R_COMMAND --http-server-address 0.0.0.0:$SERVER_PORT"
  R_COMMAND="$R_COMMAND --p2p-listen-endpoint 0.0.0.0:$PEER_PORT"
}

if [ "$MODE" == "TEST" ]; then
  echo "start test mode"
  start_node node10 eosio 8880 8890

  echo $R_COMMAND
fi