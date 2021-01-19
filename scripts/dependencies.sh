#!/bin/bash

mix deps.get

sudo apt-get update
sudo apt-get install -y wget libc-bin python3-pip

# Install gigalixir
pip3 install gigalixir