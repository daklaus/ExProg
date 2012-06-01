#!/bin/bash

COMPONENT="$1"

for i in {1..5}; do
	./test.sh $COMPONENT $i "$2"
done
