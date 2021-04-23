#! /bin/bash

function print(){
    local name=$1
    echo "The name is $name"
}

print eid

name="BOB"

print eid

echo "$name" # this prints eid not BOB if the function doesn't have local

usage(){
    echo "You need to provide an argument"
    echo "Usage : $0 file_name"
}

function does_file_exist() {
    local file="$1"
    [[ -f "$file" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage

if ( does_file_exist "$1" )
then
   echo "File found"
else
    echo "File not found"
fi
