#!/bin/bash

# prints the file
#cat readWhile.sh | while read p
#do
#    echo $p
#done

# same as above
#while read p
#do
#    echo $p
#done < readWhile.sh

# same as above, notice space after IFS=
while IFS= read -r line
do
    echo $line
done < readWhile.sh
