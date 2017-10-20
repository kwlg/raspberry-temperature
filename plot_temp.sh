#!/usr/bin/env bash

# Specify max and min temperatures
MIN_TEMP=5
MAX_TEMP=30
RANGE=$((${MAX_TEMP} - ${MIN_TEMP}))

# The file name to read from
FILE_NAME=`date "+%Y-%m-%d"`

# Initialise an array with temperatures
TEMPERATURES=()

# Loop through the file
while read LINE
do
    CONTENTS=`echo ${LINE} | cut -d, -f2-`
    CONTENTS=`printf "%.*f\n" 0 ${CONTENTS::-1}`
    TEMPERATURES+=(${CONTENTS})
done < ${FILE_NAME}

# Loop over the temperature range and the temperatures
for I in `seq 1 ${RANGE}`
do
    for TEMP in ${TEMPERATURES[*]}
    do
        if [ $((${MAX_TEMP} - ${I})) -eq ${TEMP} ]
        then
            echo -n "+"
        else
            echo -n "."
        fi
    done
    echo ""
done

echo -e "\nCurrent: ${TEMPERATURES[-1]} C"
