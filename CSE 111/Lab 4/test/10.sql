select p_type, min(l_discount), max(l_discount) from part
inner join lineitem on l_partkey is p_partkey
-- where patindex(p_type, 'ECONOMY', 'COPPER') is 1
group by p_type;
