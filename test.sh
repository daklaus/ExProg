#!/bin/bash

COMPONENT="$1"
TESTNR="$2"
FILTEROFF="$3"

[ -f $COMPONENT.test$TESTNR.dl ] || exit 1

if [ -z "$FILTEROFF" ] || [ "$FILTEROFF" -eq "0" ]; then
	FILTER="UNCOMPUTED_c,UNCOMPUTED_p,UNEXPECTED_c,UNEXPECTED_p,DUPLICATED_c,DUPLICATED_p"
fi

dlv -pfilter="$FILTER" $COMPONENT.dl $COMPONENT.test$TESTNR.dl component.tester.dl -N=60 -silent
