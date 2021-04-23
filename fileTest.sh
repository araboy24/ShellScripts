#! /bin/bash

echo -e "Enter the name of the file: \c" # -e and \c keeps curson on same line

read file_name


# -e checks if file exists
# -f checks if file is regular file (no extension?)
# -d checks directory
# -s checks if file is empty or not

if [ -e $file_name ]
then
    echo "$file_name found"
else
    echo "$file_name not found"
fi
