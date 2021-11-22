select strftime("%m", lineitem.l_shipdate) as month,
sum(lineitem.l_quantity) from lineitem 
where strftime("%Y", lineitem.l_shipdate) = "1995"
group by month;
