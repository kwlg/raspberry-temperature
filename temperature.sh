#!/usr/bin/env bash

DEV_DIR=`ls -td -- /sys/bus/w1/devices/w1_bus_master1/28-*/ | head -n 1`
if [ ! -d ${DEV_DIR} ]
then
    echo "No device folder exists" 2>&1
    exit 1
fi

DEV_FILE="${DEV_DIR}w1_slave"

if [ ! -f ${DEV_FILE} ]
then
    echo "No device file exists" 2>&1
    exit 1
fi

TEMPERATURE=$(cat ${DEV_FILE} | tail -n1 | awk '{print $10}')
TEMPERATURE="${TEMPERATURE:2:2}.${TEMPERATURE:4:7}"
TIME=`date "+%H:%M:%S"`

FILE_NAME=`date "+%Y-%m-%d"`
echo "${TIME},${TEMPERATURE}," >> ~/raspberry-temperature/${FILE_NAME}
