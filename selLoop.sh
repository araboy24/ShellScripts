#!/usr/local/bin/bash

# syntax
#select varName in list
#do
#    command1
#    command2
#    command3
#done

# prints each then asks user to select one of them and prints depending on which one was selected

#select name in mark john tom ben
#do
#    echo "$name selected"
#done


select name in mark john tom ben
do
    case $name in
    mark )
        echo mark selected ;;
    john )
        echo john selected ;;
    tom )
        echo tom selected ;;
    ben )
        echo ben selected ;;
    * )
        echo "Error please provide number between 1 and 4"
    esac
done


