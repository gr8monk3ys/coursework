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

def createPriceRange(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create PriceRange")
    try:
        sql = """create view PriceRange as 
            select maker, Product.type, min(price), max(price) from Product
            inner join PC on PC.model = Product.model
            where Product.type = "pc"
            group by Product.maker
            union
            select maker, Product.type, min(price), max(price) from Product
            inner join Printer on Printer.model = Product.model
            where Product.type = "printer"
            group by Product.maker
            union
            select maker, Product.type, min(price), max(price) from Product
            inner join Laptop on Laptop.model = Product.model
            where Product.type = "laptop"
            group by Product.maker;"""

        _conn.execute(sql)
        _conn.commit()
    except Error as e:
        print(e)
    print("++++++++++++++++++++++++++++++++++")

def printPriceRange(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Print PriceRange")
    try:
        sql = """select * from PriceRange"""
        cursor = _conn.cursor()
        cursor.execute(sql)
        l = '{:<10} {:<10} {:>10} {:>10}'.format("maker", "product", "minPrice", "maxPrice")
        print(l)
        rows = cursor.fetchall()
        for row in rows:
            data = '{:<10} {:<10} {:>10} {:>10}'.format(row[0], row[1], row[2], row[3])
            print(data)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")

def insertPC(_conn, _maker, _model, _speed, _ram, _hd, _price):
    print("++++++++++++++++++++++++++++++++++")
    try:
        sql = """insert into PC(model, speed, ram, hd, price) values({}, {}, {}, {}, {});""".format(_model, _speed, _ram, _hd, _price)
        _conn.execute(sql)
        _conn.commit()
        l = 'Insert PC ({}, {}, {}, {}, {})'.format(_model, _speed, _ram, _hd, _price)
        print(l)
        sql = """insert into Product(maker, model, type) values({}, {}, {})""".format(_maker, _model, _type)
        _conn.exectute(sql)
        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")

def updatePrinter(_conn, _model, _price):
    print("++++++++++++++++++++++++++++++++++")
    try:
        sql = """update Printer set price = {}
                where model = {};""".format(_price, _model)
        _conn.execute(sql)
        _conn.commit()
        l = 'Update Printer ({}, {})'.format(_model, _price)
        print(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")

def deleteLaptop(_conn, _model):
    print("++++++++++++++++++++++++++++++++++")
    try:
        sql = """delete from Laptop
                where model = {};""".format(_model)
        _conn.execute(sql)
        _conn.commit()
        l = 'Delete Laptop ({})'.format(_model)
        print(l)
        sql = """delete from Product 
                 where model = {}""".format(_model)
        _conn.execute(sql)
        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")

def main():
    database = r"data.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        createPriceRange(conn)
        printPriceRange(conn)

        file = open('input.in', 'r')
        lines = file.readlines()
        for line in lines:
            print(line.strip())

            tok = line.strip().split(' ')
            if tok[0] == 'I':
                insertPC(conn, tok[2], tok[3], tok[4], tok[5], tok[6], tok[7])
            elif tok[0] == 'U':
                updatePrinter(conn, tok[2], tok[3])
            elif tok[0] == 'D':
                deleteLaptop(conn, tok[2])

            printPriceRange(conn)

        file.close()

    closeConnection(conn, database)

if __name__ == '__main__':
    main()
