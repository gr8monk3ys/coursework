SELECT d.dept_no, COUNT(*) as employeeNum 
FROM departments d
INNER JOIN dept_emp e ON e.dept_no = d.dept_no
WHERE e.from_date = '1988-10-20'
GROUP BY d.dept_no		
ORDER BY employeeNum DESC;

/*
Output:

+---------+-------------+
| dept_no | employeeNum |
+---------+-------------+
| d005    |          20 |
| d004    |           9 |
| d007    |           9 |
| d001    |           4 |
| d006    |           4 |
| d008    |           3 |
| d002    |           2 |
| d003    |           2 |
| d009    |           1 |
+---------+-------------+
9 rows in set (1.08 sec)

*/