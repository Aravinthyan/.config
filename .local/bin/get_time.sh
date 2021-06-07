#!/bin/bash

# get current 24-hour time hh-mm-ss
time=$(date | awk '{print $4}')

echo $time
