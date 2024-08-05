SELECT DISTINCT b.manf as Manufacturer
FROM Beers b
GROUP BY b.manf
HAVING COUNT(b.manf) > 2;

/*
Output:

+----------------+
| Manufacturer   |
+----------------+
| Anheuser-Busch |
+----------------+
1 row in set (0.00 sec)

*/