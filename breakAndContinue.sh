#! /bin/bash

for (( i=1 ; i<=10 ; i++))
do
    if [ $i -eq 2 -o $i -eq 4 ]
    then
        continue # goes to next val of i
    fi
    if [ $i -gt 5 ]
    then
        
    echo "Uh oh 5 was reached, PEACE"
        break # gets out of the for loop
    fi
    echo "$i"
done
