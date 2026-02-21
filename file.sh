#!/bin/bash 

dir -lR  ${1:-.}| grep "^-" | sort -k4 | tail -n 1 | awk '{print $NF}'
