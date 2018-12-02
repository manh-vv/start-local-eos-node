# Steps to start test nodeos

I assume eosios was installed correctly on your marchine.
It means that you can run `nodeos` normaly.

All you need to do is run below commands in sequence:

```bash
./clean_up.sh

./start_genesis_node.sh

./generate_start_bps_cmd.sh
```

Let explain them a bit.

## Clean up

`clean_up.sh` will kill all process with pattern `keosd` or `nodeos`,
and then remove all temp folder in current directory. Temp folders are `node1*`.

## Start genesis node

`start_genesis_node.sh` follow instruction in https://developers.eos.io/eosio-nodeos/docs/bios-boot-sequence.

1. `start_keosd.sh` starts the wallet service
1. `setup_bp.sh` config needed system smart contracts and set up some sample data
1. `utils.sh` is convenient functions. I made it for make orther scripts look simple

**TIP**: `./clean_up.sh && ./start_genesis_node.sh && tail -f ./logs/node10.log`

## Add block producer

To create bps and connect it to our genesis node. Let's run script `generate_start_bps_cmd.sh`.

The script will register block producer accounts then vote for them. Later it prints out commands
which you can use to start your bps.

```bash
# sample outputed commands are
nodeos -e -p accountnum11 --genesis-json ./genesis.json --data-dir ./node11 --config-dir ./config --http-server-address 0.0.0.0:8881 --p2p-listen-endpoint 0.0.0.0:8891 --signature-provider EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc=KEY:5JqfpZngJysPemfhkWU2tT99SmP8uVR9MLzCPxSoT5UoHNpoYKh --p2p-peer-address localhost:8890 --p2p-peer-address localhost:8892 --p2p-peer-address localhost:8893 3>&1 1>./logs/node11.log 2>&1 &

nodeos -e -p accountnum12 --genesis-json ./genesis.json --data-dir ./node12 --config-dir ./config --http-server-address 0.0.0.0:8882 --p2p-listen-endpoint 0.0.0.0:8892 --signature-provider EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc=KEY:5JqfpZngJysPemfhkWU2tT99SmP8uVR9MLzCPxSoT5UoHNpoYKh --p2p-peer-address localhost:8890 --p2p-peer-address localhost:8893 --p2p-peer-address localhost:8891 3>&1 1>./logs/node12.log 2>&1 &

nodeos -e -p accountnum13 --genesis-json ./genesis.json --data-dir ./node13 --config-dir ./config --http-server-address 0.0.0.0:8883 --p2p-listen-endpoint 0.0.0.0:8893 --signature-provider EOS74hRF6C4TWnAY1MWJwFdE4NKnoYSazcTBGUEBqqP41aa2BR6Jc=KEY:5JqfpZngJysPemfhkWU2tT99SmP8uVR9MLzCPxSoT5UoHNpoYKh --p2p-peer-address localhost:8890 --p2p-peer-address localhost:8891 --p2p-peer-address localhost:8892 3>&1 1>./logs/node13.log 2>&1 &
```

## NOTE

I only start 3 nodes because running 4 EOS instance on the local environment causes my early 2015 mac-book to be halted many times.
