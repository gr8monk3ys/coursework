from logic import TruthTable

#Problem 1

table_one = TruthTable(['a'], ['-a'])
table_one.display()
print('\n')
table_two = TruthTable(['a', 'b'], ['a and b'])
table_two.display()
print('\n')
table_three = TruthTable(['a', 'b'], ['a or b'])
table_three.display()
print('\n')
table_four = TruthTable(['a', 'b'], ['a -> b'])
table_four.display()
print('\n')
table_five = TruthTable(['a', 'b'], ['a <-> b'])
table_five.display()
print('\n')

#Problem 2

logic_statement_1 = input('Enter first statement: ')
logic_statement_2 = input('Enter second statement: ')
print('\n')
myTable = TruthTable(['p', 'q'], [logic_statement_1, logic_statement_2])
myTableList = myTable.table
myTable.display()


def compare_Tables(myTableList):
    truth_counter = True
    for row in myTableList:
        
        final_elem = row[-1]
        if final_elem[0] != final_elem[1]:
            truth_counter = False

    return truth_counter


truth_counter=compare_Tables(myTableList)
if not truth_counter:
    print('They are not equivelant')
else:
    print('They are equivelant')