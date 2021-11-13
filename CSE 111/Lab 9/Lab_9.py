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

    return conn
    print("++++++++++++++++++++++++++++++++++")


def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V1")
    try:
        sql = """create view if not exists V1(c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, c_nation, c_region) as
                select c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name , r_name from nation
                inner join customer on c_nationkey = n_nationkey
                inner join region on r_regionkey = n_regionkey;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V2")

    try:
        sql = """create view if not exists V2(s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, s_nation, s_region) as
                select s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name, r_name from nation
                inner join supplier on s_nationkey = n_nationkey
                inner join region on r_regionkey = n_regionkey;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V5")

    try:
        sql = """create view if not exists V5(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment) as
                select o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate, o_orderpriority, o_clerk, o_shippriority, o_comment from orders;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V10")

    try:
        sql = """create view if not exists V10(p_type, min_discount, max_discount) as
                select p_type, min(l_discount), max(l_discount) from lineitem
                inner join part on p_partkey = l_partkey
                group by p_type;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View151(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V151")

    try:
        sql = """create view if not exists V151(c_custkey, c_name, c_nationkey, c_acctbal) as
                select c_custkey, c_name, c_nationkey, c_acctbal
                from customer
                where c_acctbal > 0;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View152(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V152")

    try:
        sql = """create view if not exists V152(s_suppkey, s_name, s_nationkey, s_acctbal) as
                select s_suppkey, s_name, s_nationkey, s_acctbal from supplier
                where s_acctbal < 0;"""

        _conn.execute(sql)

        _conn.commit()
        print("success")

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    Q1Output = open("output/1.out", "w")

    try:
        sql = """select V1.c_name, sum(round(o_totalprice, 2)) from orders
                inner join V1 on v1.c_custkey = o_custkey
                where V1.c_nation = 'FRANCE' and o_orderdate like '1995-__-__'
                group by V1.c_name;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<10}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q1Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    Q2Output = open("output/2.out", "w")

    try:
        sql = """select V2.s_region, count(*) from V2
                group by V2.s_region;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<12}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q2Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    Q3Output = open("output/3.out", "w")

    try:
        sql = """select V1.c_nation, count(*) from V1, orders
                where V1.c_custkey = o_custkey
                and V1.c_region = 'AMERICA'
                group by V1.c_nation;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q3Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")

    Q4Output = open("output/4.out", "w")

    try:
        sql = """select V2.s_name, count(ps_partkey) from V2, partsupp
                inner join part on p_partkey = ps_partkey
                where ps_suppkey = V2.s_suppkey
                and V2.s_nation = 'CANADA' and p_size < 20
                group by V2.s_name;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q4Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    Q5Output = open("output/5.out", "w")

    try:
        sql = """select V1.c_name, count(*)
                from V1, V5
                where V5.o_custkey = V1.c_custkey
                and V1.c_nation = 'GERMANY' and V5.o_orderyear like '1993-__-__'
                group by V1.c_name;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q5Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q6(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q6")

    Q6Output = open("output/6.out", "w")

    try:
        sql = """select s_name, V5.o_orderpriority, count(distinct ps_partkey) from V5
                inner join lineitem on l_partkey = ps_partkey
                inner join partsupp on ps_suppkey = l_suppkey
                inner join supplier on s_suppkey = ps_suppkey
                inner join nation on n_nationkey = s_nationkey
                where l_orderkey = V5.o_orderkey
                and n_name = 'CANADA'
                group by s_name, V5.o_orderpriority;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<15}|{:<10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q6Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q7(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q7")

    Q7Output = open("output/7.out", "w")

    try:
        sql = """select V1.c_nation, V5.o_orderstatus, count(*) from V1, V5
                where V1.c_custkey = V5.o_custkey and V1.c_region = 'AMERICA'
                group by V1.c_nation, V5.o_orderstatus;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<13}|{:<1}|{:<5}'.format(
                row[0], row[1], row[2])
            print(data)
            Q7Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q8(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q8")

    Q8Output = open("output/8.out", "w")

    try:
        sql = """select V2.s_nation, count(distinct l_orderkey) as co from V2, V5, lineitem
                where V5.o_orderkey = l_orderkey and l_suppkey = V2.s_suppkey and V5.o_orderstatus = 'F'
                and V5.o_orderyear like '1995-__-__'
                group by V2.s_nation
                having co > 50;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q8Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q9(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q9")

    Q9Output = open("output/9.out", "w")

    try:
        sql = """select count(distinct V5.o_clerk) from V2, V5, lineitem
                where V5.o_orderkey = l_orderkey and l_suppkey = V2.s_suppkey
                and V2.s_nation = 'UNITED STATES';"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<10}'.format(
                row[0])
            print(data)
            Q9Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q10")

    Q10Output = open("output/10.out", "w")

    try:
        sql = """select V10.p_type, V10.min_discount, V10.max_discount from V10
                where V10.p_type like '%ECONOMY%' and V10.p_type like '%COPPER%'
                group by V10.p_type;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<25}|{:<1}|{:<10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q10Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q11(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q11")

    Q11Output = open("output/11.out", "w")

    try:
        sql = """select V2.s_region, V2.s_name, V2.s_acctbal from V2
                where V2.s_acctbal = (select MAX(V22.s_acctbal) from V2 as V22 where V22.s_region = V2.s_region);"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<12}|{:<10}|{:<10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q11Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q12(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q12")

    Q12Output = open("output/12.out", "w")

    try:
        sql = """select V2.s_nation, max(V2.s_acctbal) as mb from V2
                group by V2.s_nation having mb > 9000;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15}|{:<10}'.format(
                row[0], row[1])
            print(data)
            Q12Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q13(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q13")

    Q13Output = open("output/13.out", "w")

    try:
        sql = """select count(*) from V1, V2, lineitem
                inner join orders on o_orderkey = l_orderkey
                where o_custkey = V1.c_custkey  and l_suppkey = V2.s_suppkey
                and V2.s_region = 'AFRICA' and V1.c_nation = 'UNITED STATES';"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<10}'.format(
                row[0])
            print(data)
            Q13Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q14(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q14")

    Q14Output = open("output/14.out", "w")

    try:
        sql = """select V2.s_region, V1.c_region, max(o_totalprice) from V2, orders, V1
                inner join lineitem on l_orderkey = o_orderkey
                where l_suppkey = V2.s_suppkey and o_custkey = V1.c_custkey
                group by V2.s_region, V1.c_region;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<12}|{:<12}|{:<10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q14Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q15(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q15")

    Q15Output = open("output/15.out", "w")

    try:
        sql = """select count(distinct l_orderkey) from V152, orders, V151
                inner join lineitem on l_orderkey = o_orderkey
                where l_suppkey = V152.s_suppkey
                and o_custkey = V151.c_custkey;"""

        cursor = _conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<12}'.format(
                row[0])
            print(data)
            Q15Output.write(data + '\n')

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    conn = openConnection(database)
    with conn:
        create_View1(conn)
        Q1(conn)

        create_View2(conn)
        Q2(conn)

        Q3(conn)
        Q4(conn)

        create_View5(conn)
        Q5(conn)

        Q6(conn)
        Q7(conn)
        Q8(conn)
        Q9(conn)

        create_View10(conn)
        Q10(conn)

        Q11(conn)
        Q12(conn)
        Q13(conn)
        Q14(conn)

        create_View151(conn)
        create_View152(conn)
        Q15(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
