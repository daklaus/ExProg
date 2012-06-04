#!/bin/bash

for i in {1..10}; do
	./test.sh "$1" $i "$2"
done
