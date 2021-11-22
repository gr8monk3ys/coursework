key_word = input("Enter a word you would like to find: ").lower()
instances = 0

with open('PythonSummary.txt','r') as file:
    for line in file:
        line = line.lower()
        line = line.replace('-', ' ')
        line = line.replace('.', '')       
        for word in line.split(' '):        
            if word == key_word:
                instances += 1

print("The word occurs {} times".format(instances))
