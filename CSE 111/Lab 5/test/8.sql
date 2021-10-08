select count(distinct s_name) from supplier, part
where p_type like '%POLISHED%' and p_size in (3, 23, 36, 49);
