import sys
sys.setrecursionlimit(100000)

def factorial(n):
    pass # This is a null statement to prevent an error before code is added.
    # Provide your code here
    if n == 0 or n == 1:
        return 1
    if n > 1:
        return n * factorial(n - 1)

        
print('factorial(5):', factorial(5))
# Expected 120

def fib(n):
    pass # This is a null statement to prevent an error before code is added.
    # Provide your code here
    if n == 1:
        return 0
    if n == 2 or n == 3:
        return 1
    if n > 3:
        return fib(n-1) + fib(n - 2)

        
print('fib(8):', fib(8))
# Expected 13

def addup(list):
    pass # This is a null statement to prevent an error before code is added.
    # Provide your code here
    if list == 0:
        return 0
    if len(list) == 1:
        return list[0]
    if len(list) > 1:
        sum = list[0] + addup(list[1:])
        return sum

print('addup([1,2,3,4,5]):', addup([1,2,3,4,5]))
# Expected 15

print('addup(range(101)):', addup(range(101)))
# Expected 5050



