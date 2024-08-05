SELECT l.drinker as Drinker
FROM Likes l
WHERE l.beer = 'Bud'
AND l.beer != 'Summerbrew'
GROUP BY l.drinker;

/*
Output:

+----------+
| Drinker  |
+----------+
| Bill     |
| Jennifer |
| Steve    |
+----------+
3 rows in set (0.01 sec)

*/