import numpy as np
from numpy import linalg

a = np.arange(1, 10, 1).reshape(3, 3) 
b = np.array([(3, 1, 4), (2, 6, 1), (2, 9, 7)])

# Part a
arr_a = a.__add__(b)
print('A + B:\n {}'.format(arr_a))

# Part b
arr_b = a.dot(b)
print('A X B:\n {}'.format(arr_b))

# Part c
arr_c = linalg.det(a)
print('Determinate of A: {}'.format(arr_c))

# Part d
arr_d = linalg.inv(b)
print('Inverse of B:\n {}'.format(arr_d))

# Part e
arr_e = linalg.eigvals(a)
print('Eigenvalues of A:\n {}'.format(arr_e))
