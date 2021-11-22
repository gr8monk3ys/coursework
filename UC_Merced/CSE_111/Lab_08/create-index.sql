
drop index if exists customer_idx_c_name;
drop index if exists customer_idx_c_mktsegment;
drop index if exists customer_idx_c_custkey;
drop index if exists customer_idx_c_mktsegment;
drop index if exists customer_idx_c_name_c_custkey;

drop index if exists nation_idx_n_nationkey_n_name;
drop index if exists nation_idx_n_regionkey_n_nationkey;
drop index if exists nation_idx_n_name;

drop index if exists region_idx_r_name_r_regionkey;
drop index if exists region_idx_r_regionkey_r_name;

drop index if exists orders_idx_o_orderdate;
drop index if exists orders_idx_o_custkey_o_orderkey;
drop index if exists orders_idx_o_custkey_o_orderdate;
drop index if exists orders_idx_o_orderkey;
drop index if exists orders_idx_o_orderstatus;
drop index if exists orders_idx_o_orderpriority_o_orderdate;
drop index if exists orders_idx_o_orderpriority_o_orderkey;

drop index if exists lineitem_idx_l_returnflag_l_receiptdate;
drop index if exists lineitem_idx_l_orderkey;
drop index if exists lineitem_idx_l_discount;
drop index if exists lineitem_idx_l_orderkey_l_suppkey;

drop index if exists supplier_idx_s_nationkey_s_acctbal;
drop index if exists supplier_idx_s_nationkey_s_suppkey;

--------------------------------------------------------------------------------

create index if not exists customer_idx_c_name on customer(c_name);
create index if not exists customer_idx_c_mktsegment on customer(c_mktsegment);
create index if not exists customer_idx_c_custkey on customer(c_custkey);
create index if not exists customer_idx_c_name_c_custkey on customer(c_name, c_custkey);
create index if not exists customer_idx_c_nationkey_c_custkey on customer(c_nationkey, c_custkey);

create index if not exists nation_idx_n_nationkey_n_name on nation(n_nationkey, n_name);
create index if not exists nation_idx_n_regionkey_n_nationkey on nation(n_regionkey, n_nationkey);
create index if not exists nation_idx_n_name on nation(n_name);

create index if not exists region_idx_r_name_r_regionkey on region(r_name, r_regionkey);
create index if not exists region_idx_r_regionkey_r_name on region(r_regionkey, r_name);

create index if not exists orders_idx_o_orderdate on orders(o_orderdate);
create index if not exists orders_idx_o_custkey_o_orderkey on orders(o_custkey, o_orderkey);
create index if not exists orders_idx_o_custkey_o_orderdate on orders(o_custkey, o_orderdate);
create index if not exists orders_idx_o_orderkey on orders(o_orderkey);
create index if not exists orders_idx_o_orderstatus on orders(o_orderstatus);
create index if not exists orders_idx_o_orderpriority_o_orderdate on orders(o_orderpriority, o_orderdate);
create index if not exists orders_idx_o_orderpriority_o_orderkey on orders(o_orderpriority, o_orderkey);

create index if not exists lineitem_idx_l_returnflag_l_receiptdate on lineitem(l_returnflag, l_receiptdate);
create index if not exists lineitem_idx_l_orderkey on lineitem(l_orderkey);
create index if not exists lineitem_idx_l_discount on lineitem(l_discount);
create index if not exists lineitem_idx_l_orderkey_l_suppkey on lineitem(l_orderkey, l_suppkey);

create index if not exists supplier_idx_s_nationkey_s_acctbal on supplier(s_nationkey, s_acctbal);
create index if not exists supplier_idx_s_nationkey_s_suppkey on supplier(s_nationkey, s_suppkey);
