CREATE TABLE region (
    r_regionkey  decimal(2,0) not null,
    r_name       char(25) not null,
    r_comment    varchar(152)
);
CREATE TABLE nation (
    n_nationkey  decimal(3,0) not null,
    n_name       char(25) not null,
    n_regionkey  decimal(2,0) not null,
    n_comment    varchar(152)
);
CREATE TABLE part (
    p_partkey     decimal(10,0) not null,
    p_name        varchar(55) not null,
    p_mfgr        char(25) not null,
    p_brand       char(10) not null,
    p_type        varchar(25) not null,
    p_size        decimal(2,0) not null,
    p_container   char(10) not null,
    p_retailprice decimal(6,2) not null,
    p_comment     varchar(23) not null
);
CREATE TABLE supplier (
    s_suppkey     decimal(8,0) not null,
    s_name        char(25) not null,
    s_address     varchar(40) not null,
    s_nationkey   decimal(3,0) not null,
    s_phone       char(15) not null,
    s_acctbal     decimal(7,2) not null,
    s_comment     varchar(101) not null
);
CREATE TABLE partsupp (
    ps_partkey     decimal(10,0) not null,
    ps_suppkey     decimal(8,0) not null,
    ps_availqty    decimal(5,0) not null,
    ps_supplycost  decimal(6,2) not null,
    ps_comment     varchar(199) not null
);
CREATE TABLE customer (
    c_custkey     decimal(9,0) not null,
    c_name        varchar(25) not null,
    c_address     varchar(40) not null,
    c_nationkey   decimal(3,0) not null,
    c_phone       char(15) not null,
    c_acctbal     decimal(7,2) not null,
    c_mktsegment  char(10) not null,
    c_comment     varchar(117) not null
);
CREATE TABLE orders (
    o_orderkey       decimal(12,0) not null,
    o_custkey        decimal(9,0) not null,
    o_orderstatus    char(1) not null,
    o_totalprice     decimal(8,2) not null,
    o_orderdate      date not null,
    o_orderpriority  char(15) not null,
    o_clerk          char(15) not null,
    o_shippriority   decimal(1,0) not null,
    o_comment        varchar(79) not null
);
CREATE TABLE lineitem (
    l_orderkey    decimal(12,0) not null,
    l_partkey     decimal(10,0) not null,
    l_suppkey     decimal(8,0) not null,
    l_linenumber  decimal(1,0) not null,
    l_quantity    decimal(2,0) not null,
    l_extendedprice  decimal(8,2) not null,
    l_discount    decimal(3,2) not null,
    l_tax         decimal(3,2) not null,
    l_returnflag  char(1) not null,
    l_linestatus  char(1) not null,
    l_shipdate    date not null,
    l_commitdate  date not null,
    l_receiptdate date not null,
    l_shipinstruct char(25) not null,
    l_shipmode     char(10) not null,
    l_comment      varchar(44) not null
);
