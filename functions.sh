#! /bin/bash

# syntax
#function name(){
#    Commands
#}
#
## or
#name() {
#    Commands
#}

function Hello(){
    echo "Hello"
}

function Bye(){
    echo "Bye"
}

function quit(){
    exit
}

function print(){
    echo $1 $2 $3
}

print Hello and Goodbye
Hello
sleep 1
Bye
sleep 1
quit
