SELECT d.dept_no 
FROM departments d
INNER JOIN dept_manager dm ON dm.dept_no = d.dept_no
GROUP BY d.dept_no
HAVING COUNT(DISTINCT dm.emp_no) > 2;

/*
Output:

+---------+
| dept_no |
+---------+
| d004    |
| d006    |
| d009    |
+---------+
3 rows in set (0.02 sec)

*/