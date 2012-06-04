#!/bin/bash

FILE="$1"

dlv -silent -FRmin -N=60 c.dl psh.dl w.dl f.dl s.dl connect.dl \
	constraints.dl abnormal.hyp fault.obs $FILE
