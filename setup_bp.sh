#!/bin/bash
echo "===== create account ====="
if [ -z "$CONTRACT_DIR" ]; then
  echo "set variable CONTRACT_DIR if you want to deploy your default system contract"
  echo "needed system contracts are: eosio.msig, eosio.token, and eosio.system"
  
  CONTRACT_DIR="./contracts"
  echo "default contracts are located at [$CONTRACT_DIR]"
fi

function ec() {
  cleos -u http://127.0.0.1:8880 --wallet-url http://127.0.0.1:8889 "$@"
}

ec get info

sleep 1

ec create account eosio eosio.bpay EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.msig EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.names EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.ram EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.ramfee EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.saving EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.stake EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.token EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG
ec create account eosio eosio.vpay EOS84BLRbGbFahNJEpnnJHYCoW9QPbQEk2iHsHGGS6qcVUq9HhutG

ec set contract eosio.token $CONTRACT_DIR/eosio.token
sleep 1

ec set contract eosio.msig $CONTRACT_DIR/eosio.msig
sleep 1

ec push action eosio.token create '[ "eosio", "10000000000.0000 SYS" ]' -p eosio.token@active
ec push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "memo" ]' -p eosio@active

ec set contract eosio $CONTRACT_DIR/eosio.system

ec push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

ec system newaccount eosio --transfer accountnum11 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "100000.0000 SYS" \
  --stake-cpu "100000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum12 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "200000.0000 SYS" \
  --stake-cpu "200000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum13 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "300000.0000 SYS" \
  --stake-cpu "300000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum14 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "400000.0000 SYS" \
  --stake-cpu "400000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum15 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "500000.0000 SYS" \
  --stake-cpu "500000.0000 SYS" --buy-ram-kbytes 32


ec system newaccount eosio --transfer accountnum21 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "60000000.0000 SYS" \
  --stake-cpu "60000000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum22 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "70000000.0000 SYS" \
  --stake-cpu "70000000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum23 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "80000000.0000 SYS" \
  --stake-cpu "80000000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum24 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "90000000.0000 SYS" \
  --stake-cpu "90000000.0000 SYS" --buy-ram-kbytes 32

ec system newaccount eosio --transfer accountnum25 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "100000000.0000 SYS" \
  --stake-cpu "100000000.0000 SYS" --buy-ram-kbytes 32

sleep 1

ec system newaccount eosio --transfer accountnum31 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "10000.0000 SYS" \
  --stake-cpu "10000.0000 SYS" --buy-ram-kbytes 4096


ec system newaccount eosio --transfer accountnum32 \
  EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc \
  --stake-net "1000.0000 SYS" \
  --stake-cpu "1000.0000 SYS" --buy-ram-kbytes 2048

ec system regproducer accountnum11 EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc https://lecle.co.kr
ec system regproducer accountnum12 EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc https://lecle.co.kr

sleep 1
ec system listproducers


## NODE: producer have to be voted and elected before start
# sleep 10
# ec system voteproducer prods accountnum21 accountnum11 accountnum12 -p

sleep 1
ec system listproducers
