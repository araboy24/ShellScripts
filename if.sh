#! /bin/bash

# syntax of if statement
#if [ condition ]
#then
#    statement
#fi

params=$#

if (( $params > 0 ))
then
    count=$1
else
    echo "No param was given so count is 0"
#    echo $#
    count=0
fi

if [ $count -lt 10 ]
then
    echo "Count less than 10"
else
    echo "Count greater or equal to 10"
fi

# String comparison

word=abc

if [ $word != abc]
then
    echo "word is not abc"
else
    echo "word is abc"
fi
