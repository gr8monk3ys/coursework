#!/bin/bash

rm -f score.res
rm -f output/*

score=0
qnum=15
db="tpch.sqlite"

sqlite3 $db < empty-tables.sql
sqlite3 $db < load-tpch.sql

for (( i=1; i<=$qnum; i++ ))
do
	sqlite3 $db < test/$i.sql | sort > output/$i.out
	diff -w output/$i.out results/${i}.res > /dev/null
	if [ $? -eq 0 ]
	then
		echo "Query $i: PASS" >> score.res
		echo "Query $i: PASS"
		score=$((score+1))
	else
		echo "Query $i: FAIL" >> score.res
		echo "Query $i: FAIL"
	fi
done

echo "Total score: $score" >> score.res
echo "Total score: $score"

if [ $score -ne $qnum ] ; then
	echo "Some queries failed. Try again for full score."
	exit 1
else
	echo "All queries passed. Good job!!!"
	exit 0
fi
