#! /bin/bash

# CASE SYNTAX

#case expression in
#    pattern1 )
#        statements ;;
#    pattern2 )
#        statements ;;
#    ...
#esac

vehicle=$1 # vehicle is first arg

case $vehicle in
    "car" )
        echo "Rent of $vehicle is 100 dollars" ;;
    "van" )
        echo "Rent of $vehicle is 80 dollars" ;;
    "bike" )
        echo "Rent of $vehicle is 5 dollars" ;;
    "truck" )
        echo "Rent of $vehicle is 150 dollars" ;;
    * )
        echo "Unknown Vehicle" ;;
esac

echo -e "Enter a character: \c"
read val

case $val in
    [a-z] )
        echo "lower case letter" ;;
    [A-Z] )
        echo "Upper case letter" ;;
    [0-9] )
        echo "Number" ;;
    ? )
        echo "Other" ;;
    * )
        echo "invalid input: Only type 1 character"
esac
