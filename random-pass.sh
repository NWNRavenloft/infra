#!/bin/bash
# replace with file to read
password=""
for (( i=1; i<=3; i++))
do
    random_word=$(shuf -n 1 words.txt)
    password="$password $random_word"
done
echo $password