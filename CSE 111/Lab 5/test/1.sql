select count(c_custkey) from customer
inner join region on r_regionkey is n_regionkey
inner join nation on n_nationkey is c_nationkey
where r_name is not 'EUROPE' and r_name is not 'AFRICA' and r_name is not 'ASIA';
