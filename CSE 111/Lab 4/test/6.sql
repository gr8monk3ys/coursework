select distinct s_name, o_orderstatus, count(*) from supplier, orders, nation
where n_name is 'CANADA'
order by o_orderpriority; 