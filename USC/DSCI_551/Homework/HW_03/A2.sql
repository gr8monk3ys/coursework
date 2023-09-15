SELECT DISTINCT e.first_name, e.last_name 
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 150000;

/*
Output:

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Tokuyasu   | Pesch     |
| Ibibia     | Junet     |
| Xiahua     | Whitcomb  |
| Lansing    | Kambil    |
| Willard    | Baca      |
| Tsutomu    | Alameldin |
| Charmane   | Griswold  |
| Weicheng   | Hatcliff  |
| Mitsuyuki  | Stanfel   |
| Sanjai     | Luders    |
| Honesty    | Mukaidono |
| Weijing    | Chenoweth |
| Shin       | Birdsall  |
| Mohammed   | Moehrke   |
| Lidong     | Meriste   |
+------------+-----------+
15 rows in set (2.72 sec)

*/