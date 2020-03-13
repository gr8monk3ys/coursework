	.data
n:      .word 13

        .text
main: 	
		add     $t0, $0, $zero
		addi    $t1, $t0, 1
		addi    $t2, $t1, 2
		addi    $t3, $t2, 3
		addi    $t4, $t3, 4
		addi    $t5, $t4, 5
		addi    $t6, $t5, 6
		addi    $t7, $t6, 7

finish: addi    $a0, $t7, 0
		li      $v0, 1
		syscall			
		li      $v0, 10		
		syscall			