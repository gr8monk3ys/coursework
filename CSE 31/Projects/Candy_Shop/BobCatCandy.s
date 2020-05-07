
.data 

string1: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars! \n"

string2: .asciiz "Please enter the price of a BobCat Bar: "

string3: .asciiz "Please enter the number of wrappers needed to exchange for a new bar: "

string4: .asciiz "How, many do you have? "

string5: .asciiz "Good! Let me run the number... \n"



string6: .asciiz "You first buy "

string7: .asciiz " bars. \n"

string8: .asciiz "With $" 

string9: .asciiz ", you will receive a maximum of "

string10: .asciiz " BobCat bars! \n"



string11: .asciiz "You first buy "

string12: .asciiz "Then, you will get another. "


# everything above this line is used for the interface of the project
string13: .asciiz "\n"



.text


		#This is the main program.
		#It first asks user to enter the price of each BobCat Bar.
		#It then asks user to enter the number of bar wrappers needed to exchange for a new bar.
		#It then asks user to enter how much money he/she has.
		#It then calls maxBars function to perform calculation of the maximum BobCat Bars the user will receive based on the information entered. 
		#It then prints out a statement about the maximum BobCat Bars the user will receive.


main:

		addi $sp, $sp -12 	#Feel free to change the increment value if you need space
		sw $ra, 0($sp)
		
		# Implement your main here
		
		li $s0, 0	# this is the price of a bar
		li $s1, 0	# s1 stores the number of wrappers
		li $s2, 0	# s2 stores how many the user has
		li $s3, 0	#s3 is the total
		li $s4, 0       #s4 is the remaining amount
		li $s5, 0	#s5 is the #newremainaing amount
		li $s6, 0	#s6 keepts track of the counter
		
		
		
		li $v0, 4		#used to print str 1
		la $a0, string1
		syscall
		
	
		
		li $v0, 4		#used to print str 2
		la $a0, string2
		syscall
		
		li $v0, 4		#used to print string3
		la $a0, string13
		syscall
		
			
		addi $v0, $0, 5			#v0 contains the integer that has been read
		syscall
		
		addi $sp, $sp -4
		sw $v0, 0($sp)
		lw $s0, 0($sp)
		add $v0, $s0, $zero 		#storing the price of each bobcat bar that the user has inputted
		
		#string3
		li $v0, 4		#used to print str 3
		la $a0, string3
		syscall
		
		
		li $v0, 4		#for better reading this is ued to print a new line
		la $a0, string13
		syscall
		
		addi $v0, $0, 5			#used to contain the read integer
		syscall
		
		addi $sp, $sp -4		
		sw $v0, 0($sp)
		lw $s1, 0($sp)
		add $v0, $s1, $zero 		#stores the wrapper count
		
		
		
		li $v0, 4		#prints string 4
		la $a0, string4
		syscall
		
		
		li $v0, 4		#new line again
		la $a0, string13
		syscall	
		
		
		addi $v0, $0, 5
		syscall
		
		
		addi $sp, $sp -4
		sw $v0, 0($sp)
		lw $s2, 0($sp)
		add $v0, $s2, $zero 	#stores the total value that the user has in the temp register 2
		
		
		#string5
		li $v0, 4
		la $a0, string5
		syscall
		jal maxBars 		# Call maxBars to calculate the maximum number of Bobcat Bars


		j end 			#Jump up end of program


		# This function calculates the maximum number of BobCat Bars.
		# It takes in 3 arguments ($a0, $a1, $a2) as n, price, and money. It returns the maximum number of bars

maxBars:				
                
		div $s2, $s0    	#total =  totalmoney dividied by the number of bars
		mflo $s3		#stores total of money divided by the bar
		jal conditional		#if wrapper count is equal to 0 or total is equal to 0 additionalBars to second case
		jr $ra
		
		# End of maxBars

newBars:
		# This function calculates the number of BobCat Bars a user will receive based on n.
		# It takes in 2 arguments ($a0, $a1) as number of wrappers left so far and n.
		addi $sp, $sp, -4	# Push stack frame for local storage
		sw $ra, 0($sp)
		
		bge $a0, $s1, conditional
		j end
		# End of newBars
		
		
		
		
conditional:
				#check statements if a number that logically does not make sense is entered jump to end
		beq $s2, 0, end
		beq $s1,0,end
		ble $s0, 0, end
		ble $s1, 0, end
		ble $s2, 0, end
		
		div $s2, $s0			#divide the 2 integers
		mflo $s3			#carry over the lo value
		beq $s3, $0, end		#check if s3 is equal to 0 if so then go to end
		li $v0, 4			#used to call string 6
		la $a0, string6			#you will have that amount of bars
		syscall
		
		li $v0, 1			# v0 is the result register and it is moving the value into a0
		move $a0, $s3			#moving the total amount into a0
		syscall
		
		li $v0, 4
		la $a0, string7			#calling string 7 to print "bars"
		syscall
		
		add $s6, $s6, $s3		#counter plus total and saving it to s6
		jal additionalBars
		
		
additionalBars:				#recursive algorithim to keep printing out "another" bars they will get

		beq $s3, $0, end		#if the total is 0 bars to end
		div $s3, $s1
		mflo $s4
		beq $s4, $0, end		#if the remaining amount do to calculations is 0 bars to end
		li $v0, 4
		la $a0, string12		
		syscall
		
		li $v0, 1			#load the value 
		move $a0, $s4			#moving value across register
		move $s3, $s4			##moving value across register
		syscall
		
		li $v0, 4			#printing out "bars"
		la $a0, string7
		syscall
		
		add $s6, $s6, $s4
		jal additionalBars           # additionalBars and link to additionalBars as a recursion algorithim


		
	      # It takes in 2 arguments ($a0, $a1) as number of bars so far and n. 


end: 
                la $t0, ($s2)    #loads in total money
		la $t1, ($s6)    #loads in counter
		#strl8

		
		# Terminating the program
		
		li $v0, 4
		la $a0, string8
		syscall
		
		li $v0, 1
		move $a0, $s2
		syscall
		
		li $v0, 4
		la $a0, string9
		syscall
		
		li $v0, 1
		move $a0, $s6
		syscall
		
		li $v0, 4
		la $a0, string10
		syscall
		
		lw $ra, 0($sp)
		addi $sp, $sp 12
		
		li $v0, 10 
		syscall

			
