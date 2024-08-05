SELECT BB.Manufacturer,AVG(BB.Price) as Average
FROM Beers2Bars BB
GROUP BY BB.Beer;

/*
Output:

+----------------+---------+
| Manufacturer   | Average |
+----------------+---------+
| Anheuser-Busch |       3 |
| Anheuser-Busch |       3 |
| Heineken       |       2 |
| Anheuser-Busch |       3 |
| Pete's         |     3.5 |
+----------------+---------+
5 rows in set (0.00 sec)

*/