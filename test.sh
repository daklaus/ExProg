#!/bin/bash

TESTER="$1"
COMPONENT="$2"
TESTNR="$3"
FILTERON="$4"

[ -f $COMPONENT.test$TESTNR.dl ] || exit 1

if [ -z "$FILTERON" ] || [ "$FILTERON" -eq "0" ]; then
	FILTER="UNCOMPUTED_c,UNCOMPUTED_p,UNEXPECTED_c,UNEXPECTED_p,DUPLICATED_c,DUPLICATED_p"
fi

dlv -pfilter="$FILTER" $COMPONENT.dl $COMPONENT.test$TESTNR.dl $TESTER.tester.dl -N=60 -silent
