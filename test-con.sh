#!/bin/bash

FILTEROFF="$1"

FILTER="UNCOMPUTED_c,UNCOMPUTED_p,UNEXPECTED_c,UNEXPECTED_p,DUPLICATED_c,DUPLICATED_p"

if [ "$FILTEROFF" -eq "1" ]; then
	FILTER2=",c_max,in_c,out_c,in_p,out_p,c,p"
fi

for TESTNR in {1..10}; do
	[ -f connect.test$TESTNR.dl ] || continue
	dlv -N=60 -silent -pfilter="$FILTER$FILTER2" c.dl psh.dl w.dl f.dl s.dl \
		connect.dl connect.test$TESTNR.dl connect.tester.dl
done
