#! /bin/bash

response='c'

echo "Enter the string you would like to use"
read og_string

lower_string=$( echo $og_string | tr 'A-Z', 'a-z')


function maxChar(){
    echo "M was entered"
}

function lengthEncoding() {

    # count=0
    # output=""
    # char="${lower_string:0:1}"
    
    # for ((i=1;i<=${#lower_string};i++)); do
    #     curr_char=${lower_string:$i-1:1}  
    #      if [ "$curr_char" != "$char" ]
    #     then
            
    #         add="$count$curr_char"
    #         output="${$output$add}
    #         count=1
    #     else
    #         count=$count+1
    #     fi
    #     # echo ${lower_string:$i-1:1}
    # done

    # if [ $count -gt 0 ]
    # then
    #     add="$count$curr_char"
    #     output="${$output$add}
    # fi
    # echo "$output"

    echo "L was entered"
    echo "String is $lower_string"

}


while [ $response != "q" ]
do
    echo "Select the Operation you want to run"
    echo "Type M or L"
    read response

    if [ $response = "M" ]
    then
        maxChar
    elif [ $response = "L" ]
    then 
        lengthEncoding
    fi
done
