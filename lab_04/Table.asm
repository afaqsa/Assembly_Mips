.data
	msg1: .asciiz "Enter the table Number :: "
	msg2: .asciiz " * "
	msg3: .asciiz " = "
	li_break: .asciiz "\n"
.text
	li $t1 , 11
	li $t2, 1
	
	li $v0 , 4
	la $a0 , msg1
	syscall
	
	li $v0 , 5
	syscall
	
	move $t0, $v0
	
Loop:
	bge $t2,$t1 , exit
	
	li $v0 , 1
	move $a0, $t0
	syscall
	
	
	li $v0 , 4
	la $a0, msg2
	syscall
	
	li $v0 , 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	mul $t3 , $t0, $t2
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0 , 4
	la $a0, li_break
	syscall
	addi $t2,$t2,1
j Loop

exit:
li $v0 , 10
syscall