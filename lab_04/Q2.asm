.data 
	msg1: .asciiz "Enter a positive number :: "
	msg2: .asciiz "\nSum is :: "
.text
	li $t0,1
	li $t2 , 0
	 li $v0 , 4
	 la $a0, msg1
	 syscall
	 
	 li $v0 , 5
	 syscall
	 
	  move $t1 ,$v0
loop:
	bgt $t0, $t1 , exit
	
	 add $t2, $t2 , $t0
	 addi $t0, $t0, 1
	  j loop
exit:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0 , 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall