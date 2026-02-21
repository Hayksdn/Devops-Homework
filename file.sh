#!/bin/bash

find $1 -type f | xargs ls -lS | head -n 1 | awk -F ' ' '{print $9}'

