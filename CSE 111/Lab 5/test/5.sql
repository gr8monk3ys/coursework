select s_name, p_size, min(ps_supplycost) from supplier, partsupplier, part
inner join supplier on s_
where p_type is 'STEEL' and r_name is 'ASIA'