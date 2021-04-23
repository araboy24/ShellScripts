#! /bin/bash

num1=20
num2=5

# need $(( 1 + 1 )) format
echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

# or this format
echo $(expr $num1 + $num2)

# * doesn't work with expr, needs a \*
# like this
echo $(expr $num1 \* $num2)

# the above methods only work for ints not floats

f1=20.5
f2=2.5

# this does float math, bc is calculator for floats
echo "20.5+5" | bc
echo "$f1+$f2" | bc
echo "$f1-$f2" | bc
echo "$f1*$f2" | bc
echo "$f1/$f2" | bc # this is wrong
echo "scale=2;$f1/$f2" | bc # this is right, scale is num of dec places
echo "$f1%$f2" | bc

# square root
num=27
echo "scale=20; sqrt($num)" | bc -l

# power
echo "scale=2;3^3" | bc -l # -l is the math library

