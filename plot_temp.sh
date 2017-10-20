#!/usr/bin/env bash

# The file name to read from
FILE_NAME=`date "+%Y-%m-%d"`

# Initialise an array with temperatures
TEMPERATURES=()

# Loop through the file
while read LINE
do
    CONTENTS=`echo ${LINE} | cut -d, -f2`
    CONTENTS=`printf "%.*f\n" 0 ${CONTENTS::-1}`
    TEMPERATURES+=(${CONTENTS})

    if [ ${#TEMPERATURES[@]} -eq 1 ]
    then
        MAX_TEMP=${CONTENTS}
        MIN_TEMP=${CONTENTS}
    else
        if [ ${CONTENTS} -lt ${MIN_TEMP} ]
        then
            MIN_TEMP=${CONTENTS}
        fi

        if [ ${CONTENTS} -gt ${MAX_TEMP} ]
        then
            MAX_TEMP=${CONTENTS}
        fi
    fi

done < ${FILE_NAME}

# Specify max and min temperatures
MIN_RANGE=$((${MIN_TEMP} - 1))
MAX_RANGE=$((${MAX_TEMP} + 1))
RANGE=$((${MAX_RANGE} - ${MIN_RANGE}))

# Loop over the temperature range and the temperatures
for I in `seq 0 ${RANGE}`
do
    printf "%3d " $((${MAX_RANGE} - ${I}))

    for TEMP in ${TEMPERATURES[*]}
    do
        if [ $((${MAX_RANGE} - ${I})) -eq ${TEMP} ]
        then
            echo -n "+"
        else
            echo -n "."
        fi
    done
    echo ""
done

echo -e "\nCurrent: ${TEMPERATURES[-1]} C"
echo "Min: ${MIN_TEMP} C"
echo "Max: ${MAX_TEMP} C"
echo "Number of measurements: ${#TEMPERATURES[@]}"
