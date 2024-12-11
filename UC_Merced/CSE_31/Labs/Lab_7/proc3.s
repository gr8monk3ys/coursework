		.data
x:		.word 5
y:		.word 10
m:		.word 15
b:		.word 2
		.text
MAIN:	la $t0, x
		lw $s0, 0($t0)	# s0 = x
		la $t0, y
		lw $s1, 0($t0) 	# s1 = y
		
		# Prepare to call sum(x, y)
		add $a0, $zero, $s0	# Set a0 as input argument for SUM
		add $a1, $zero, $s1	# Set a1 as input argument for SUM
		jal SUM
		add $t0, $t0, $t1
		add $s0, $s0, $s1
		addi $a0, $s1, 0 
		li $v0, 1		 
		syscall	
		j END

		
SUM: 		addi $sp, $sp -4
        	sw $ra, 0($sp)        # Backup $ra from main
		
        	addi $sp, $sp -4
        	sw $s0, 0($sp)        # Backup $s0 from main
		
        	addi $sp, $sp -4
        	sw $s1, 0($sp)        # Backup $s1 from main
		
        	addi $a0, $a0, 1      # Preparing for sub 1
        	addi $a1, $a1, 1      # Preparing for sub 1
        	
		# Prepare to call sub(a, b)
		add $a0, $zero, $s0	# Set $a0 as input argument for SUM
		add $a1, $zero, $s1	# Set $a1 as input argument for SUM
		jal SUB	
		
		add $t0, $v0, $zero   #storing $v0 to $t0

        	addi $a0, $a0, -2
        	move $t1, $a0
        	
        	addi $a1, $a1, -2        	
        	move $a0, $a1
        	
        	move $a1, $t1
        	
		# Prepare to call sub(a, b)
        	jal SUB

        	add $t1, $v0, $zero

        	lw $s1, 0($sp)        # Restore $s1 from SUM
        	addi $sp, $sp 4

		lw $s0, 0($sp)        # Restore $s0 from SUM
        	addi $sp, $sp 4

        	lw $ra, 0($sp)        # Restore $ra from SUM
        	addi $sp, $sp 4
        
        	jr $ra		
		
SUB:
		addi $sp, $sp -4
		sw $ra, 0($sp)		# Backup $ra from SUM
		
		sub $v0, $a0, $a1
		lw $ra, 0($sp)        	# Restore ra from SUM
		
        	addi $sp, $sp 4
        	jr $ra

		
END:
