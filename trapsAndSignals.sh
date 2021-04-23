#! /bin/bash
trap "echo Exit signal is detected" SIGKILL #SIGINT
# trap can't stop kill, but can stop interrupt
echo "pid is $$"
while (( COUNT < 10 ))
do
    sleep 10
    (( COUNT ++ ))
    echo $COUNT
done
exit 0

# ctrl-c is interupt signal SIGINT 2
# ctrl-z is suspend signal
# kill -9 PID of the process from other terminal window, it kills the process

trap "echo Exit command is detected" 0
# the trap executes when the exit value 0 is found,
# so this prints after hello world

echo "Hello world"

exit 0
