#! /bin/bash

stack=()
count=0
userInput=''

function printStack(){
    printf '%s ' "${stack[@]}"
    printf "\n"
}

function delete(){
    # unset 'stack[$count]'
    unset 'stack[0]'
}

function evaluate(){
    if [ ${stack[0]} = "s" ]
    then
        unset stack[0]
        stack=( "${stack[@]:1}" )
        ((count=count-1))
        temp=${stack[0]}
        stack[0]=${stack[1]}
        stack[1]=$temp
        # temp=${stack[count-1]}
        # stack[$count-1]=${stack[count-2]}
        # stack[$count-2]=$temp

    elif [ ${stack[count-1]} = "+" ]
    then
        unset stack[$count-1]
        ((count=count-1))
        if [[ "${stack[count-1]}" =~ ^-?[0-9]+$ ]]
        then
            if [[ "${stack[count-2]}" =~ ^-?[0-9]+$ ]]
            then
                ((sum=${stack[count-2]}+${stack[count-1]}))
                unset stack[$count-1]
                ((count=count-1))
                stack[$count-1]=$sum
            fi
        fi
    elif [ ${stack[count-1]} = "d" ]
    then 
        ((count=count-1))
        unset stack[$count]
        if [ $count -ge 1 ]
        then
            ((count=count-1))
            unset stack[$count]
        fi
    fi
}

until [ "$userInput" = "x" ]
do
    read -p "> " userInput
    if [[ -z "$userInput" ]]
    then
        continue
    fi
    if [ $userInput = "+" ] || [ $userInput = "s" ] || [ $userInput = "d" ]
    then
        # stack[count]=$userInput
        stack=("$userInput" "${stack[@]}")
        ((count=count+1))
    elif [ $userInput = "p" ]
    then
        printStack
    elif [[ "$userInput" =~ ^-?[0-9]+$ ]]
    then
        # stack[count]=$userInput
        stack=("$userInput" "${stack[@]}")
        ((count=count+1))
    elif [ $userInput = "e" ]
    then
        evaluate
    elif [ $userInput = "x" ]
    then
        continue
    else
        echo "Not a valid input"
    fi
    
done

