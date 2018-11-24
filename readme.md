# Steps to start test nodeos

I assume eosios was installed correctly on your marchine.
It means that you can run `nodeos` normaly.

## Clean up

`clean_up.sh` will kill all process with pattern `keosd` or `nodeos`,
and then remove all temp folder in current directory.

## Start genesis node

`start_genesis_node.sh` follow instruction in https://developers.eos.io/eosio-nodeos/docs/bios-boot-sequence.

1. `start_keosd.sh` starts the wallet service
1. `setup_bp.sh` config needed system smart contracts and set up some sample data

**TIP**: `./clean_up.sh && ./start_genesis_node.sh`

## Add block producer

## NOTE

Running 4 EOS instance on the local environment causes me to restart computer many times due to hang out.
So please consider to turn off all other applications before running this test.
