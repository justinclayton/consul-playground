#!/bin/bash

BINARY=2
T=1
number=$RANDOM

let "number %= $BINARY"
if [ $number -eq $T ]; then
  echo "Everything is broken!"
  exit 42
else
  echo "Everything is normal."
  exit 0
fi

