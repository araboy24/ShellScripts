#! /bin/bash

# $0 is the script name,
# $1, $2 etc are the parameters typed after script name separated by spaces

echo $0 $1 $2 $3 ' > echo $1 $2 $3'

args=("$@") # this stores them in an array

echo ${args[0]} ${args[1]} ${args[2]} # this prints them NOTICE starts at 0

echo $@ # does same as previous line

echo "Number of args: $#" # prints number of arguments passed
