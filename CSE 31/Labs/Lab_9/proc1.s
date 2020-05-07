        .data
str1: .asciiz "Less than\n"
str2: .asciiz "Greater than or equal to\n"

	.text
	# TPS 1 part 6
	addi $s0, $zero, 25
	
	li $v0, 5	#read value from user
	syscall
	move $s1, $v0	

	# Tps 1 part 9
	slt $t0, $s1, $s0
	
	# Tps 1 part 14
	bne $t0, $zero, LESS
	
	# Tps 1 part 20
	j GREQ

LESS:	li $v0, 4 
	la $a0, str1 
	syscall 	
	j END

GREQ:	li $v0, 4 
	la $a0, str2 
	syscall 	
	j END
			
END:	li $v0, 10		
	syscall

