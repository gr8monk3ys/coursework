select count(distinct s_name) from supplier, part
where p_type is '%POLISHED%' and
(p_size is 3 or p_size is 23 or p_size is 36 
or p_size is 49)
group by s_name;
