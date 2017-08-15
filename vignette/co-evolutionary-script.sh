#!/bin/bash

tree=$1
data=$2

output=$(basename $data)
output="${output%.*}"

HOME=$(pwd)

# Independent ML
BayesTraitsV3 $tree $data << ANSWERS
2
1
SMMR 0 3000
MLTries 100
LogFile $HOME/$output-indep
run
ANSWERS

# Dependent ML
BayesTraitsV3 $tree $data  << ANSWERS
3
1
SMMR 0 3000
MLTries 100
LogFile $HOME/$output-dep
run
ANSWERS
