#!/bin/bash

rm -f score.res
rm -f tpch.sqlite
touch tpch.sqlite

score=0

sqlite3 tpch.sqlite < create-schema-tpch.sql
sqlite3 tpch.sqlite < check-schema-tpch.sql > output.out

diff -w output.out result.res > /dev/null
if [ $? -eq 0 ]
then
	echo "Schema is correct." >> score.res
	echo "Schema is correct."
	score=15
else
	echo "Schema is incorrect." >> score.res
	echo "Schema is incorrect."
fi

echo "Total score: $score" >> score.res
echo "Total score: $score"

