SELECT d.name as Drinker 
FROM Drinkers d
LEFT JOIN Likes l on d.name = l.drinker
WHERE l.drinker IS NULL;

/*
Output:

+---------+
| Drinker |
+---------+
| David   |
+---------+
1 row in set (0.00 sec)

*/