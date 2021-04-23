#! /bin/bash

var=31

readonly var

#var=50 # doesn't work because var is readonly, not write

echo $var

hello(){
    echo "Hello world"
}

readonly -f hello # can't override hello function

hello(){
    echo "nope"
}

hello
