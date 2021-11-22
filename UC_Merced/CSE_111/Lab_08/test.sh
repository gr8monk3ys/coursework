#!/bin/bash

rm -f score.res
rm -f output/*

score=0
qnum=15

for (( i=1; i<=$qnum; i++ ))
do
	sqlite3 tpch.sqlite < test/$i.sql > output/$i.out
	diff -w <(sort output/$i.out) <(sort results/${i}.res) > /dev/null
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

if [ $score -ne 15 ] ; then
	echo "Some queries failed. Try again for full score."
	exit 1
else
	echo "All queries passed. Good job!!!"
	exit 0
fi
