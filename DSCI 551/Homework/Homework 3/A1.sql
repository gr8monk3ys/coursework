SELECT e.emp_no FROM employees e
WHERE e.first_name = 'mary' AND SUBSTR(e.last_name, -2, 1) = 'o';

/*
Output:

+--------+
| emp_no |
+--------+
|  16021 |
|  21756 |
|  52983 |
|  73998 |
|  78783 |
|  88698 |
| 101753 |
| 216534 |
| 263268 |
| 410311 |
| 423386 |
| 459548 |
| 491899 |
+--------+
13 rows in set (0.11 sec)

*/