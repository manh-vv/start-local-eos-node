#!/usr/bin/env bash

# load utils
source ./utils.sh

echo "===== create account ====="
if [ -z "$CONTRACT_DIR" ]; then
  echo "set variable CONTRACT_DIR if you want to deploy your default system contract"
  echo "needed system contracts are: eosio.msig, eosio.token, and eosio.system"
  
  CONTRACT_DIR="./contracts"
  echo "default contracts are located at [$CONTRACT_DIR]"
fi
echo

ec_genesis get info
echo
echo

function create_system_account {
  SYSTEM_ACCOUNT_NAME=$1
  ec_genesis create account eosio $SYSTEM_ACCOUNT_NAME \
    EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG 3>&1 1>/dev/null 2>&1
}

create_system_account eosio.bpay
create_system_account eosio.msig
create_system_account eosio.names
create_system_account eosio.ram
create_system_account eosio.ramfee
create_system_account eosio.saving
create_system_account eosio.stake
create_system_account eosio.token
create_system_account eosio.vpay

ec_genesis set contract eosio.token $CONTRACT_DIR/eosio.token
ec_genesis set contract eosio.msig $CONTRACT_DIR/eosio.msig

ec_genesis push action eosio.token create '[ "eosio", "10000000000.0000 SYS" ]' -p eosio.token@active
ec_genesis push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "memo" ]' -p eosio@active

ec_genesis set contract eosio $CONTRACT_DIR/eosio.system

ec_genesis push action eosio setpriv '["eosio.msig", 1]' -p eosio@active
sleep 1

echo "create sample accounts"
eosio_create_account accountnum11 100000 100000
eosio_create_account accountnum12 200000 200000
eosio_create_account accountnum13 300000 300000
eosio_create_account accountnum14 400000 400000
eosio_create_account accountnum15 500000 500000

eosio_create_account accountnum21 60000000 60000000
eosio_create_account accountnum22 70000000 70000000
eosio_create_account accountnum23 80000000 80000000
eosio_create_account accountnum24 90000000 90000000
eosio_create_account accountnum25 100000000 100000000

eosio_create_account accountnum31 10000 10000 4096
eosio_create_account accountnum32 5000 5000 2048
echo "create sample accounts === DONE"
echo
echo

## NODE: producer have to be voted and elected before start
# ec_genesis system voteproducer prods accountnum21 accountnum11 accountnum12 -p
