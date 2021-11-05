.eqp on

select l_receiptdate, l_returnflag, l_extendedprice, l_tax
from lineitem
where l_returnflag = 'R' and l_receiptdate = '1993-08-22';
