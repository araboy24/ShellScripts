#!/usr/local/bin/bash
#
## syntax
#for VARIABLE in 1 2 3 4 5 .. N
#do
#    command1
#    command2
#    command3
#done
#
##OR---------
#for VARIABLE in file1 file2 file3
#do
#    command1 on $VARIABLE
#    command2
#    command3
#done
#
##OR---------
#for VARIABLE in $(Linux-Or-Unix-Command-Here)
#do
#    command1 on $OUTPUT
#    command2 on $OUTPUT
#    command3
#done
#
##OR---------
#for ((EXP1; EXP2; EXP3))
#do
#    command1
#    command2
#    command3
#done

#echo ${BASH_VERSION}
#
#for VARIABLE in {1..10..2} # START..END..INCREMENT, doesn't work on mac, but works on linux
#do
#    echo $VARIABLE
#done

for (( i=0; i<5; i++ ))
do
    echo $i
done

for command in ls pwd date
do
    echo "--------$command---------"
    $command
done

for item in * # * is each thing in ls -a
do
    if [ -d $item ]
    then
        echo $item
    fi
done


