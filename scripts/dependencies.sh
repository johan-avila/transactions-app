#!/bin/bash

mix local.rebar --force
mix local.hex --force

mix deps.get

apt-get update
apt-get install -y wget libc-bin python3-pip

pip3 install gigalixir