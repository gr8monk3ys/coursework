with open("CompletePunishment.txt", 'w') as file:
    sentence = input("Input a sentence: ")
    repeat = input("Input number of repeats for the sentence: ")

    for i in range(int(repeat)):
        file.write(sentence + '\n')
