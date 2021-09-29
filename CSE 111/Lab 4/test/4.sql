select s_name, count(p_size) from supplier, part, nation
where p_size < 20 and n_name is 'CANADA'
group by s_name;