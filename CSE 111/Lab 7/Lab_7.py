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


def createTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create table")
    try:
        sql = """create table warehouse(
                    w_warehousekey decimal(9,0) not null,
                    w_name char(100) not null,
                    w_capacity decimal(6,0) not null,
                    w_suppkey decimal(9,0) not null,
                    w_nationkey decimal(2,0) not null)"""
        _conn.execute(sql)

        _conn.commit()
        print("success")
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Drop tables")

    try:
        sql = "drop table warehouse"
        _conn.execute(sql)

        _conn.commit()
        print("success")
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def populateTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Populate table")
    i = 1
    id = 1
    tmpPopTableHolder = {'w_warehousekey': 1, 'w_name': 'tmp1',
                         'w_capacity': 1, 'w_suppkey': 1, 'w_nationkey': 1}
    listTmpPopTableHolder = []
    listTmpCapacity = []
    tmp200List = []
    try:

        # Warehouse ID StartV
        idSql = """select s_name from supplier"""
        cur = _conn.cursor()
        cur.execute(idSql)
        rows = cur.fetchall()

        for row in rows:
            tmpPopTableHolder.update({"w_warehousekey": i, 'w_suppkey': id})
            tmpPopTableHolder_copy = tmpPopTableHolder.copy()
            # print(tmpPopTableHolder)
            listTmpPopTableHolder.append(tmpPopTableHolder_copy)
            i = i + 1
            tmpPopTableHolder.update({"w_warehousekey": i, 'w_suppkey': id})
            tmpPopTableHolder_copy = tmpPopTableHolder.copy()
            listTmpPopTableHolder.append(tmpPopTableHolder_copy)

            i = i + 1
            id = id + 1
        # WareHouse ID Finish^
        # WareHouse Nation Start V
        id = 0
        for row in rows:
            nameSql = """select n_name, count(l_linenumber) as totalNum, n_nationkey from lineitem
                        inner join customer on c_custkey = o_custkey
                        inner join orders on o_orderkey = l_orderkey
                        inner join supplier on s_suppkey = l_suppkey
                        inner join nation on n_nationkey = c_nationkey 
                        where s_name = '{}'
                        group by n_name
                        order by totalNum desc, n_name asc
                        limit 2""".format(row[0])
            cur2 = _conn.cursor()
            cur2.execute(nameSql)
            rows2 = cur2.fetchall()
            for row2 in rows2:
                listTmpPopTableHolder[id].update(
                    {'w_name': row[0] + '___' + row2[0], 'w_nationkey': row2[2]})
                tmp200List.append(id)
                id = id + 1
        # WareHouse Nation End ^
        # WareHouse Capacity Begins V
        for row in rows:
            capacitySql = """with nTotal as(
                            select n_name,  s_name, sum(p_size) as totalSize from lineitem
                            inner join nation on c_nationkey = n_nationkey
                            inner join customer on c_custkey = o_custkey
                            inner join orders on o_orderkey = l_orderkey
                            inner join supplier on s_suppkey = l_suppkey
                            inner join part on p_partkey = l_partkey 
                            where s_name = '{}'
                            group by n_name, s_name)
                            select max(nTotal.totalSize) * 2 as DoubleMaxTotalPartSize from nTotal;""".format(row[0])
            cur3 = _conn.cursor()
            cur3.execute(capacitySql)
            rows3 = cur3.fetchall()
            for row3 in rows3:
                listTmpCapacity.append(row3[0])

        id = 0
        for x in listTmpCapacity:
            listTmpPopTableHolder[id].update({'w_capacity': x})
            listTmpPopTableHolder[id+1].update({'w_capacity': x})
            id = id + 2
        # WareHouse Capacity Ends ^
        # Inserting Data Into warehouse Table Begins V

        for x in tmp200List:
            sql = "insert into warehouse values(?,?,?,?,?)"
            args = [listTmpPopTableHolder[x]['w_warehousekey'], listTmpPopTableHolder[x]['w_name'],
                    listTmpPopTableHolder[x]['w_capacity'], listTmpPopTableHolder[x]['w_suppkey'], listTmpPopTableHolder[x]['w_nationkey']]
            _conn.execute(sql, args)

        # Inserting Data Into warehouse Table Ends ^

        _conn.commit()
        print("success")
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    Q1Output = open("output/1.out", "w")
    Q1Write = open("output/1.out", "w")

    try:
        sql = """select w_warehousekey as wId, w_name as wName, w_capacity as wCap, w_suppkey as sId, w_nationkey as nId from warehouse
                group by w_warehousekey;"""
        cursor = _conn.cursor()
        cursor.execute(sql)
        header = '{:>10} {:<40} {:<17} {:<10} {:<10}'.format(
            "wId", "wName", "wCap", "sId", "nId")
        print(header)
        Q1Write.write(header + '\n')
        rows = cursor.fetchall()
        for row in rows:
            data = '{:>10} {:<40} {:<10} {:>10} {:>10}'.format(
                row[0], row[1], row[2], row[3], row[4])
            print(data)
            Q1Write.write(data + '\n')

    except Error as e:
        _conn.rollback()
        print(e)

    Q1Write.close()
    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    Q2Output = open("output/2.out", "w")
    Q2Write = open("output/2.out", "w")

    try:
        sql = """select n_name, count(w_warehousekey), sum(w_capacity) from warehouse
                    inner join nation on n_nationkey = w_nationkey
                    group by n_name
                    order by count(w_warehousekey) desc, n_name asc"""
        cursor = _conn.cursor()
        cursor.execute(sql)
        header = '{:<20} {:>10} {:>10}'.format(
            "nation", "numW", "totCap")
        print(header)
        Q2Write.write(header + '\n')
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<20} {:>10} {:>10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q2Write.write(data + '\n')

    except Error as e:
        _conn.rollback()
        print(e)

    Q2Write.close()

    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    Q3Output = open("output/3.out", "w")
    Q3Write = open("output/3.out", "w")

    input = open("input/3.in", "r")
    dataList = input.read().splitlines()

    try:
        sql = """select s_name, n2.n_name, w_name from supplier, nation as n1, warehouse, nation as n2
                    where w_nationkey = n1.n_nationkey and n1.n_name = '{}' and s_suppkey = w_suppkey
                    and s_nationkey = n2.n_nationkey
                    group by s_name
                    order by s_name asc""".format(dataList[0])
        cursor = _conn.cursor()
        cursor.execute(sql)
        header = '{:<20} {:<20} {:<10}'.format(
            'supplier', 'nation', 'warehouse')
        print(header)
        Q3Write.write(header + '\n')
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<20} {:<20} {:<10}'.format(
                row[0], row[1], row[2])
            print(data)
            Q3Write.write(data + '\n')
    except Error as e:
        _conn.rollback()
        print(e)

    Q3Write.close()

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")

    Q4Output = open("output/4.out", "w")
    Q4Write = open("output/4.out", "w")

    input = open("input/4.in", "r")
    dataList = input.read().splitlines()

    try:
        sql = """select w_name, w_capacity from warehouse
                    inner join nation on n_nationkey = w_nationkey
                    inner join region on r_regionkey = n_regionkey
                    where r_name = '{}' and w_capacity > {}
                    group by w_name
                    order by w_capacity desc""".format(dataList[0], dataList[1])
        cursor = _conn.cursor()
        cursor.execute(sql)
        header = '{:<10} {:>30}'.format(
            'warehouse', 'capacity',)
        print(header)
        Q4Write.write(header + '\n')
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<36} {:<20}'.format(
                row[0], row[1])
            print(data)
            Q4Write.write(data + '\n')
    except Error as e:
        _conn.rollback()
        print(e)

    Q4Write.close()

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    Q5Output = open("output/5.out", "w")
    Q5Write = open("output/5.out", "w")

    input = open("input/5.in", "r")
    dataList = input.read().splitlines()

    try:
        sql = """with regionTotalCapacity as(
                    select r_name as name, sum(w_capacity) as sumCap from nation as n1, warehouse, nation as n2, region
                    inner join supplier on s_suppkey = w_suppkey
                    where w_nationkey = n1.n_nationkey
                    and s_nationkey = n2.n_nationkey
                    and n2.n_name = '{}'
                    and n1.n_regionkey = r_regionkey
                    group by r_name)
                    select r_name, case when regionTotalCapacity.sumCap > 0 then regionTotalCapacity.sumCap else 0 end from region
                    left join regionTotalCapacity on r_name = regionTotalCapacity.name
                    group by r_name
                    order by r_name asc""".format(dataList[0])
        cursor = _conn.cursor()
        cursor.execute(sql)
        header = '{:<15} {:>10}'.format(
            'region', 'capacity',)
        print(header)
        Q5Write.write(header + '\n')
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<15} {:>10}'.format(
                row[0], row[1])
            print(data)
            Q5Write.write(data + '\n')
    except Error as e:
        _conn.rollback()
        print(e)

    Q5Write.close()

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        dropTable(conn)
        createTable(conn)
        populateTable(conn)

        Q1(conn)
        Q2(conn)
        Q3(conn)
        Q4(conn)
        Q5(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
