#!/bin/bash

read -s -n 1 key
if [[ $key = "" ]]; then
    echo 'You pressed enter!'
else
    echo "You pressed '$key'"
fi
read -s -n 1 key
if [[ $key = "" ]]; then
    echo 'You pressed enter!'
else
    echo "You pressed '$key'"
fi
read -s -n 1 key
if [[ $key = "" ]]; then
    echo 'You pressed enter!'
else
    echo "You pressed '$key'"
fi
read -s -n 1 key
if [[ $key = "" ]]; then
    echo 'You pressed enter!'
else
    echo "You pressed '$key'"
fi
