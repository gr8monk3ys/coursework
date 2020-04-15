arr=[]
for i in range (0,9):
    
    val = input("Enter integer: ")
    intVal = int(val)
    arr.append(intVal)

maxVal = arr[0]
for j in range (0,9):
    
    if arr[j] > maxVal:
        maxVal = arr[j]

print("Max Value: " + str(maxVal))