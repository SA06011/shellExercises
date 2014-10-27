#!/bin/bash

if [ $# -le 0 ]; then
	echo "batchrename dictory current_postfix expected_postfix"
	exit 0
fi

if [ ! -d $1 ]; then
	echo "the directory does not exist!"
	exit 0
fi

file_lst=`find $1 -name *.$2`
for tmpfile in $file_lst
do 
	echo $tmpfile
	newname=$(echo $tmpfile|sed -n "s/${2}/${3}/p")
	echo $newname
	mv $tmpfile $newname
done 
