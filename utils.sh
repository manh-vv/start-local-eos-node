#!/usr/bin/env bash

# make log foler 
if [ ! -d "./logs" ]; then
  echo "make directory [./logs]"
  mkdir ./logs
fi

utils_log_file="./logs/utils.log"
# clean log
echo "" > $utils_log_file


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

function ec_genesis {
  cleos -u http://127.0.0.1:8880 --wallet-url http://127.0.0.1:8889 "$@"
}

function create_account {
  CREATOR_NAME=$1
  ACCOUNT_NAME=$2
  stake_net=100000
  stake_cpu=100000
  buy_ram_kbytes=32

  if [ ! -z "$3" ]; then stake_net=$3; fi
  if [ ! -z "$4" ]; then stake_cpu=$4; fi
  if [ ! -z "$5" ]; then buy_ram_kbytes=$5; fi
  
  if [ "$MODE" == "TEST" ]; then
    echo "create_account $CREATOR_NAME $ACCOUNT_NAME $stake_net $stake_cpu $buy_ram_kbytes"
    return
  fi

  ec_genesis system newaccount $CREATOR_NAME --transfer $ACCOUNT_NAME \
    EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
    --stake-net "$stake_net.0000 SYS" \
    --stake-cpu "$stake_cpu.0000 SYS" --buy-ram-kbytes $buy_ram_kbytes
}

function eosio_create_account {
  create_account eosio $@ 3>&1 1>>$utils_log_file 2>&1
}

if [ "$MODE" == "TEST" ]; then
  echo "start test mode"
  start_node node10 eosio 8880 8890

  echo $R_COMMAND

  # test eosio_create_account
  eosio_create_account accountnum11 100000 100000
fi