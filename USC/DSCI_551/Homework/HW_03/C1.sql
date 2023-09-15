CREATE VIEW Beers2Bars AS
SELECT DISTINCT b.name as Beer, b.manf as Manufacturer, B.name as Bar, s.price as Price
FROM Beers b
INNER JOIN Sells s ON s.beer = b.name
INNER JOIN Bars B ON B.name = s.bar
ORDER BY b.name;

SELECT * FROM Beers2Bars;

/*
Output:

+------------+----------------+------------+-------+
| Beer       | Manufacturer   | Bar        | Price |
+------------+----------------+------------+-------+
| Bud        | Anheuser-Busch | Bob's bar  |     3 |
| Bud        | Anheuser-Busch | Joe's bar  |     3 |
| Bud        | Anheuser-Busch | Mary's bar |  NULL |
| Bud Lite   | Anheuser-Busch | Joe's bar  |     3 |
| Bud Lite   | Anheuser-Busch | Mary's bar |     3 |
| Budweiser  | Heineken       | Mary's bar |     2 |
| Michelob   | Anheuser-Busch | Joe's bar  |     3 |
| Summerbrew | Pete's         | Bob's bar  |     3 |
| Summerbrew | Pete's         | Joe's bar  |     4 |
+------------+----------------+------------+-------+
9 rows in set (0.00 sec)

*/