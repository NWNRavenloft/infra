#!/bin/bash
# sysinfo_page - A script to add participants to the PoTM Web project. Creates an user account, a DB user, and appends to nginx locations.

if [ $# -ne 1 ]; then
    echo "<user>"
    exit 1
fi

# Random password from random-pass.sh
password=$(./random-pass.sh)
echo "$1"":""$password" >> passwords.txt

# Create user
./create-user.sh "$1" "$password"

# Create DB user
./create-db-user.sh potmtest "$1" "$password"

# Append nginx location conf
location=$(cat location-template.txt)
echo "${location//\{user\}/$1}" >> nginx-potm-locations.conf