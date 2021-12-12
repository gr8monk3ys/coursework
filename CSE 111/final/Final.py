import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def T1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T1")

    code = _conn.cursor()

    sql = """
    select count(distinct l_orderkey) from (select l_orderkey, l_suppkey, count(*) as cnt from lineitem
    group by l_orderkey, l_suppkey having cnt = 2);
    """

    code.execute(sql)
    result = code.fetchall()

    with open("output/1.out", "w") as file:
        header = "{:>10}\n".format("orders")
        file.write(header)
        output = "{:>10}\n".format(result)
        file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def T2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T2")

    code = _conn.cursor()

    sql = """
    select n_name, count(distinct o_orderkey) from orders, lineitem l1, lineitem l2, supplier
    inner join nation on n_nationkey = s_nationkey
    where l1.l_partkey != l2.l_partkey and l1.l_suppkey = l2.l_suppkey and l1.l_orderkey = o_orderkey 
    and l1.l_orderkey = l2.l_orderkey and l1.l_orderkey = o_orderkey and s_suppkey = l1.l_suppkey
    group by n_name;
    """
    code.execute(sql)
    result = code.fetchall()

    with open("output/2.out", "w") as file:
        header = "{:<40} {:>10}\n".format("nation", "orders")
        file.write(header)
        for row in result:
            output = "{:<40} {:>10}\n".format(row[0], row[1])
            file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def T3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T3")

    code = _conn.cursor()
    with open("input/3.in", "r") as file:
        k = int(file.readline().strip())

    sql = """
    select n_name, count(distinct l_orderkey) from (select n_name, l_orderkey, l_suppkey, count(l_partkey)
    as numOrders from lineitem
    inner join supplier on s_suppkey = l_suppkey
    inner join nation on n_nationkey = s_nationkey
    group by l_orderkey, l_suppkey having numOrders = ?)
    group by n_name;
    """

    code.execute(sql, [k])
    result = code.fetchall()

    with open("output/3.out", "w") as file:
        header = "{:<40} {:>10}\n".format("nation", "orders")
        file.write(header)
        for row in result:
            output = "{:<40} {:>10}\n".format(row[0], row[1])
            file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def T4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T4")

    code = _conn.cursor()

    sql_drop = """drop table if exists RegionItems;"""

    sql_create = """
        create table if not exists RegionItems(
        supReg char(25) not null,
        custReg char(25) not null,
        itemNo decimal(8,0) not null);
    """
    sql_insert = """
    insert into RegionItems
    select r1_name, r2_name, count(l_partkey) from (
    select r1.r_name as r1_name, s_suppkey, n_nationkey from region r1, nation
    inner join supplier on s_nationkey = n_nationkey
    where r1.r_regionkey = n_regionkey) as supplierRegion,
    
    (select r2.r_name as r2_name, c_custkey, n_nationkey from region r2, nation
    inner join customer on c_nationkey = n_nationkey
    where r2.r_regionkey = n_regionkey) as customerRegion, orders

    inner join lineitem on l_orderkey = o_orderkey
    where supplierRegion.s_suppkey = l_suppkey and customerRegion.c_custkey = o_custkey
    group by r1_name, r2_name;
    """
    sql_print = """select * from RegionItems;"""

    code.execute(sql_drop)
    code.execute(sql_create)
    _conn.commit()

    code.execute(sql_insert)
    code.execute(sql_print)

    result = code.fetchall()

    with open("output/4.out", "w") as file:
        header = "{:<40} {:<40} {:>10}\n".format("supReg", "custReg", "items")
        file.write(header)
        for res in result:
            output = "{:<40} {:<40} {:>10}\n".format(res[0], res[1], res[2])
            file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def T5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T5")

    code = _conn.cursor()
    with open("input/5.in", "r") as file:
        nation = file.readline().strip()

    sql = """
    delete from RegionItems where supReg in(select r_name from lineitem
    inner join nation on n_nationkey = s_nationkey
    inner join supplier on s_suppkey = l_suppkey
    inner join region on r_regionkey = n_regionkey
    where n_name = ?);
    """

    sql_print = """select * from RegionItems;"""

    code.execute(sql, [nation])
    _conn.commit()

    code.execute(sql_print)

    result = code.fetchall()

    with open("output/5.out", "w") as file:
        header = "{:<40} {:<40} {:>10}\n".format("supReg", "custReg", "items")
        file.write(header)
        for row in result:
            output = "{:<40} {:<40} {:>10}\n".format(row[0], row[1], row[2])
            file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def T6(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("T6")

    code = _conn.cursor()
    with open("input/6.in", "r") as file:
        oldNation = file.readline().strip()
        newNation = file.readline().strip()

    sql_drop = """drop trigger if exists region_change;"""

    sql_trigger = """
        create trigger region_change after update on nation
        begin
            update RegionItems set CustReg = (
            select r_name from customer
            inner join region on r_name = n_name
            inner join nation on n_nationkey = c_nationkey
            where n_name = NEW.n_name) 
            where CustReg in (select r_name from nation
            inner join regino on r_name = n_name
            inner join customer on c_nationkey = n_nationkey
            where n_name = OLD.n_name);
        end; 
    """

    sql_update = """
    update nation set n_name = '{}'
    where n_name = '{}';
    """.format(newNation, oldNation)

    sql_print = """select * from RegionItems;"""

    code.execute(sql_drop)
    # code.execute(sql_trigger)
    code.execute(sql_update)
    # code.execute(sql_test)
    code.execute(sql_print)

    result = code.fetchall()

    with open("output/6.out", "w") as file:
        header = "{:<40} {:<40} {:>10}\n".format("supReg", "custReg", "items")
        file.write(header)
        for row in result:
            output = "{:<40} {:<40} {:>10}\n".format(row[0],row[1],row[2])
            file.write(output)

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        T1(conn)
        T2(conn)
        T3(conn)
        T4(conn)
        T5(conn)
        T6(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
