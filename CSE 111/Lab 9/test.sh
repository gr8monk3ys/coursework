#!/bin/bash

rm -f score.res
rm -f output/*

score=0
qnum=15

javac Lab_9.java
java -classpath ".:sqlite-jdbc-3.32.3.2.jar" Lab_9

python3 Lab_9.py

sqlite3 tpch.sqlite ".schema" > output/schema.out

if grep -q -i "create view V1" output/schema.out; then
  echo ""
else
	echo "View V1 does not exist!" >> score.res
	echo "View V1 does not exist!"
	exit 1
fi

if grep -q -i "create view V2" output/schema.out; then
  echo ""
else
	echo "View V2 does not exist!" >> score.res
	echo "View V2 does not exist!"
	exit 1
fi

if grep -q -i "create view V5" output/schema.out; then
  echo ""
else
	echo "View V5 does not exist!" >> score.res
	echo "View V5 does not exist!"
	exit 1
fi

if grep -q -i "create view V10" output/schema.out; then
  echo ""
else
	echo "View V10 does not exist!" >> score.res
	echo "View V10 does not exist!"
	exit 1
fi

if grep -q -i "create view V151" output/schema.out; then
  echo ""
else
	echo "View V151 does not exist!" >> score.res
	echo "View V151 does not exist!"
	exit 1
fi

if grep -q -i "create view V152" output/schema.out; then
  echo ""
else
	echo "View V152 does not exist!" >> score.res
	echo "View V152 does not exist!"
	exit 1
fi


for (( i=1; i<=$qnum; i++ ))
do
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
	echo "Some queries failed. Try again."
	exit 1
else
	echo "All queries passed. Good job!!!"
	exit 0
fi

