#!/bin/bash

BINARY=2
T=1
number=$RANDOM

let "number %= $BINARY"
[[ $number -eq $T ]] || exit 42
exit 0