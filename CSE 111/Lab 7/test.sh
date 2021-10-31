#!/bin/bash

rm -f score.res
rm -f output/*

score=0
qnum=5

javac Lab_7.java
java -classpath ".:sqlite-jdbc-3.32.3.2.jar" Lab_7

python3 Lab_7.py

for (( i=1; i<=$qnum; i++ ))
do
	diff -w <(sort output/$i.out) <(sort results/${i}.res) > /dev/null
	if [ $? -eq 0 ]
	then
		echo "Query $i: PASS" >> score.res
		echo "Query $i: PASS"
		score=$((score+3))
	else
		echo "Query $i: FAIL" >> score.res
		echo "Query $i: FAIL"
	fi
done

echo "Total score: $score" >> score.res
echo "Total score: $score"

if [ $score -ne 15 ] ; then
	echo "Some queries failed. Try again."
	exit 1
else
	echo "All queries passed. Good job!!!"
	exit 0
fi
