import numpy as np

# Part a
arr_a = np.arange(2, 10, 1).reshape(4, 2)
print('4 x 2 matrix:\n {}', arr_a)

# Part b
final = []
n = 8

for i in range(n):
    final.append(list(np.tile([0,1], int(n / 2))) if i % 2 == 0 else list(np.tile([1,0], int(n / 2)))) 
print('Checker board:\n {}'.format(np.array(final)))

# Part c
list_c = [10, 20, 10, 30, 20, 40, 20, 20, 10, 30, 0, 50, 10]

arr_c = np.unique(list_c)
print('Unique values: {}'.format(arr_c))

# Part d
list_d = [6, 75, 9, 82, 36, 42, 59, 3, 52, 1, 32, 68, 93, 4, 27, 85, 0, -3, 57]

arr_d = np.array(list_d)
print('Values greater than 37: {}'.format(arr_d[arr_d > 37]))

# Part e
list_e = [0, 12, 45.21 ,34, 99.91]

arr_e = np.asarray(list_e)
f_arr_e = [(i * (9/5)) + 32 for i in list_e] 
print('Farenheit: {}'.format(f_arr_e))
