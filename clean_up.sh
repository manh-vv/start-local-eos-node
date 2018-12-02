#!/bin/bash

echo "pkill all processes by keosd"
pkill -f keosd

echo "pkill all processes by nodeos"
pkill -f nodeos

echo "remove all folder start by node1*"
rm -rf node1*

sleep 1
echo "task of clean up done"
