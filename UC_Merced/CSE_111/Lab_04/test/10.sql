select p_type, min(l_discount), max(l_discount) from lineitem, part
where l_partkey is p_partkey and p_type like '%EConOMY%' and p_type like '%COPPER%'
group by p_type;
