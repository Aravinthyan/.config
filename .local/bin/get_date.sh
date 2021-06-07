#!/bin/bash

echo $(date | awk '{print $1" "$2" "$3" "$6}')
