#! /bin/bash

# while syntax

#while [ condition ]
#do
#    command1
#    command2
#    command3
#done

#n=1
#
##while [ $n -le 10 ]
#while (( $n <= 10 )) # same as above
#do
#    echo "$n"
##    n=$(( n+1 )) # increments n
#    (( n++ )) # increments n
##    sleep 1 # pauses code for 1 second
#done

n=1
while [ $n -le 3 ]
do
   echo "$n"
   (( n++ ))
#   gnome-terminal & # opens new terminal on linux
#    xterm & # opens new terminal on linux
done
