numbers = input("Enter numbers followed by a space: ").split()
sum = 0

while(True):
    if len(numbers) < 2:
        numbers = input('Need more than one integer, try again: ').split()
    else:
        for num in numbers:
            sum += int(num) 
        print("Sum of numbers is: {}".format(sum))
        break


