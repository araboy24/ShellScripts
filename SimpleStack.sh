#! /bin/bash

stack=()
undoneStack=()
userInput=''

function printStack(){
    printf '%s ' "${stack[@]}"
    printf "\n"
    delete
    printf '%s ' "${stack[@]}"
    printf "\n"
}

function delete(){
    # reassigns stack to itself without first element
    stack=( "${stack[@]:1}" )
}

function evaluate(){
    printf '%s ' "${stack[@]}" #displays stack contents
    printf "\n"
    delete # gets rid of e
    if [ ${stack[0]} = "s" ]
    then
        # checks if there is at least 3 values in the stack
        if [[ ${#stack[@]} -ge 3 ]]
        then
            # storing values that are about to change
            undoneStack=( "${stack[@]:0:3}" ) 
            delete # getting rid of the s
            
            # Swapping the values
            temp=${stack[0]} 
            stack[0]=${stack[1]}
            stack[1]=$temp

            #Printing the updated stack
            printf '%s ' "${stack[@]}"
            printf "\n"
        else # Not enough values in the stack to perform swap
            delete # gets rid of the s and prints the stack
            echo "Not enough values in stack to perform a swap"
            printf '%s ' "${stack[@]}"
            printf "\n"
        fi
    elif [ ${stack[0]} = "d" ]
    then
        # Store d and value after it in case of future undo
        undoneStack=( "${stack[@]:0:2}" )
        delete # Remove d
        delete # Remove whats after d

        #Print updated stack
        printf '%s ' "${stack[@]}"
        printf "\n"
        
    elif [ ${stack[0]} = "+" ]
    then
        # Store first 3 values of stack in undoneStack
        undoneStack=( "${stack[@]:0:3}" )
        delete # remove +
        if [[ "${stack[0]}" =~ ^-?[0-9]+$ ]] && [[ "${stack[1]}" =~ ^-?[0-9]+$ ]]
        then
            ((sum=${stack[0]}+${stack[1]}))
            delete
            stack[0]=$sum

            # Print stack 
            printf '%s ' "${stack[@]}"
            printf "\n"
        else
            echo "+ is invalid for these numbers"
        fi
    elif [ ${stack[0]} = "^" ]
    then
        # Store first 3 values of stack in undoneStack
        undoneStack=( "${stack[@]:0:3}" )
        delete # remove ^
        if [[ "${stack[0]}" =~ ^-?[0-9]+$ ]] && [[ "${stack[1]}" =~ ^-?[0-9]+$ ]]
        then
            ((xor=${stack[0]}^${stack[1]}))
            delete
            stack[0]=$xor

            # Print stack 
            printf '%s ' "${stack[@]}"
            printf "\n"
        else
            echo "^ is invalid for these numbers"
        fi
    elif [ ${stack[0]} = "&" ]
    then
        # Store first 3 values of stack in undoneStack
        undoneStack=( "${stack[@]:0:3}" )
        delete # remove &
        if [[ "${stack[0]}" =~ ^-?[0-9]+$ ]] && [[ "${stack[1]}" =~ ^-?[0-9]+$ ]]
        then
            ((and=${stack[0]}&${stack[1]}))
            delete
            stack[0]=$and

            # Print stack 
            printf '%s ' "${stack[@]}"
            printf "\n"
        else
            echo "& is invalid for these numbers"
        fi
    elif [ ${stack[0]} = "|" ]
    then
        # Store first 3 values of stack in undoneStack
        undoneStack=( "${stack[@]:0:3}" )
        delete # remove |
        if [[ "${stack[0]}" =~ ^-?[0-9]+$ ]] && [[ "${stack[1]}" =~ ^-?[0-9]+$ ]]
        then
            ((or=${stack[0]}&${stack[1]}))
            delete
            stack[0]=$or

            # Print stack 
            printf '%s ' "${stack[@]}"
            printf "\n"
        else
            echo "| is invalid for these numbers"
        fi
    else
        printf '%s ' "${stack[@]}"
        printf "\n"
    fi
}

function readFromFile(){
    echo -e "Enter the name of the file : \c"
    read file_name
    
    if [ -f "$file_name" ] # does the file exist
    then
        if [ -r "$file_name" ] # can the file be read
        then
            for line in `cat "$file_name"` # Loops throught file line by line
            do
                if [[ -z "$line" ]] # checks if line is empty
                then
                    continue
                fi
                if [ $line = "+" ] || [ $line = "s" ] || [ $line = "d" ]
                then
                    stack=("$line" "${stack[@]}")
                    printf '%s ' "${stack[@]}"
                    printf "\n"
                elif [ $line = "&" ] || [ $line = "|" ] || [ $line = "^" ]
                then
                    stack=("$line" "${stack[@]}")
                    printf '%s ' "${stack[@]}"
                    printf "\n"
                elif [[ "$line" =~ ^-?[0-9]+$ ]]
                then
                    stack=("$line" "${stack[@]}")
                elif [ $line = "p" ]
                then
                    stack=("$line" "${stack[@]}")
                    printStack
                elif [ $line = "e" ]
                then
                    stack=("$line" "${stack[@]}")
                    evaluate
                elif [ $line = "x" ]
                then
                    continue
                else
                    echo "Not a valid input"
                fi
            done
        else
            echo "$file_name doesn't exist"
        fi        
    fi
}

function performUndo(){
    # print stack
    printf '%s ' "${stack[@]}"
    printf "\n"
    delete # remove u

    if [[ ${undoneStack[0]} = "s" ]] 
    then 
        stack=( "${undoneStack[@]:0:3}" "${stack[@]:2}" )
    elif [[ ${undoneStack[0]} = "d" ]] 
    then 
        stack=( "${undoneStack[@]:0:2}" "${stack[@]}" )
    elif [[ ${undoneStack[0]} = "+" ]] || [[ ${undoneStack[0]} = "^" ]] || [[ ${undoneStack[0]} = "&" ]] || [[ ${undoneStack[0]} = "|" ]] 
    then
        if [[ ${#undoneStack[@]} -ge 3 ]]
        then
            delete
            stack=( "${undoneStack[@]:0:3}" "${stack[@]}" )
            undoneStack=()
        fi
    else
        echo "Nothing to undo"
    fi
    printf '%s ' "${stack[@]}"
    printf "\n"
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
        stack=("$userInput" "${stack[@]}") # add to stack

        # print stack 
        printf '%s ' "${stack[@]}"
        printf "\n"
    elif [ $userInput = "&" ] || [ $userInput = "|" ] || [ $userInput = "^" ]
    then
        # add to stack
        stack=("$userInput" "${stack[@]}")
        
        # print stack 
        printf '%s ' "${stack[@]}"
        printf "\n"
    elif [[ "$userInput" =~ ^-?[0-9]+$ ]]
    then
        # add to stack
        stack=("$userInput" "${stack[@]}")
    elif [ $userInput = "p" ]
    then
        # add to stack
        stack=("$userInput" "${stack[@]}")
        printStack
    elif [ $userInput = "e" ]
    then
        # add to stack
        stack=("$userInput" "${stack[@]}")
        evaluate
    elif [ $userInput = "u" ]
    then
        # add to stack
        stack=("$userInput" "${stack[@]}")
        performUndo
    elif [ $userInput = "r" ]
    then
        readFromFile
    elif [ $userInput = "x" ]
    then
        continue
    else
        echo "Not a valid input"
    fi
done