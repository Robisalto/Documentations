#!/bin/bash

set -ex


for file in $(ls Scripts/)
do
    bash -n ${PWD}/Scripts/${file}
    bash -n 
done