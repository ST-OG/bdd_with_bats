#!/bin/sh


echo "Im Good"

test_ping() {
   ping "${1}" -c 1 -q
}

case $1 in
   test_ping) "$@"; exit;;
esac