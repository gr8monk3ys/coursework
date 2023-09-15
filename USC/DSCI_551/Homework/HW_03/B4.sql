SELECT s.bar as Bar
FROM Sells s
ORDER BY s.price DESC;

/*
Output:

+------------+
| Bar        |
+------------+
| Joe's bar  |
| Bob's bar  |
| Bob's bar  |
| Joe's bar  |
| Joe's bar  |
| Joe's bar  |
| Mary's bar |
| Mary's bar |
| Mary's bar |
+------------+
9 rows in set (0.00 sec)

*/
