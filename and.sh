#! /bin/bash

age=25

# The next 3 lines are the same
#if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
#if [ "$age" -gt 18 -a "$age" -lt 30 ]
if [[ "$age" -gt 18 && "$age" -lt 30 ]]
then
    echo "valid age"
else
    echo "age not valid"
fi

