arr=[]
for i in range (0,9):
    val = input("Enter integer: ")
    intVal = int(val)
    arr.append(intVal)

oddArr=[]
for j in range (0,9):    
    if arr[j] % 2 == 1 :
        oddArr.append(arr[j])

if len(oddArr) == 0:
    print("No odd numbers were entered")
else:
    maxVal = oddArr[0]
    for k in range (len(oddArr)):
        if oddArr[k] > maxVal:
            maxVal = oddArr[k]

    print("Max Value: " + str(maxVal))