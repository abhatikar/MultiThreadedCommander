#!/bin/bash

function jobidfromstring()
{
	local STRING;
	local RET;

	STRING=$1;
	RET="$(echo $STRING | sed 's/^[^0-9]*//' | sed 's/[^0-9].*$//')"
	echo $RET;
}

runmultitask()
{
	JOBLIST=""
	TASKLIST[0]=""
	i=0

	for TASK in "${cmdarray[@]}"
	#for TASK in "$@"
	do
		echo $TASK
		${TASK} &
		LASTJOB=`jobidfromstring $(jobs %%)`
		JOBLIST="$JOBLIST $LASTJOB"
		TASKLIST[$i]=$TASK
		i=$(($i+1))
	done

	i=0
	for JOB in $JOBLIST ; do
		wait %$JOB
		echo "${TASKLIST[$i]} – Job $JOB exited with status $?"
		i=$(($i+1))
	done
}

total="$(cat allrepo.txt | wc -l)"

echo ${total}

iter=0;
cmdarray=();
for iter in $(seq 1 ${total} )
do
	repo="${PWD}/github-clone.sh $(cat allrepo.txt | sed -n ${iter}p)"
	cmdarray=("${cmdarray[@]}" "${repo}")
done

runmultitask
