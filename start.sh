#!/data/data/com.termux/files/usr/bin/bash

# if config.env does not exist
if [ ! -f "config.env" ]; then
    echo "config.env does not exist"
    exit
fi

source config.env

expect -f start.expect
