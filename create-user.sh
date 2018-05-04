#!/bin/bash

# syspage_info - A script to add an user. Parameters: <user> <password>

if [ $# -ne 2 ]; then
    echo "<user> <password>"
    exit 1
fi

adduser $1 --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo $1:$2 | chpasswd