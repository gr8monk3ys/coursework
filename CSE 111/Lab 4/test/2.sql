select r_name, count(s_name) from supplier, region
group by r_name;