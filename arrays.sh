#! /bin/bash

os=('ubuntu' 'windows' 'kali' 'osx')

os[4]='linux' # adds 4th index to array
os[4]='iOS' # replaces linux with iOS

unset os[2] # unset removes kali from array

echo "${os[@]}" # prints all

echo "${os[1]}" # prints index 1

echo "${!os[@]}" # prints the indexes of the array

echo "${#os[@]}" # prints array length

string=dadasdwfwlkmfwe
echo "${string[0]}" # prints the whole string
echo "${string[@]}" # prints the whole string
echo "${string[1]}" # prints nothing bc array length is 1
