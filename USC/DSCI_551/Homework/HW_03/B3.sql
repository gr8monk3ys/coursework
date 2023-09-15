SELECT s.bar as Bar, COUNT(s.beer) as Total 
FROM Sells s
WHERE s.price > 2
GROUP BY s.bar;

/*
Output:

+------------+-------+
| Bar        | Total |
+------------+-------+
| Bob's bar  |     2 |
| Joe's bar  |     4 |
| Mary's bar |     1 |
+------------+-------+
3 rows in set (0.00 sec)

*/