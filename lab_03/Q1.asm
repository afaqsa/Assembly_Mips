.data
# Declaring Variables 
	testInt: .word 0
	msg: .asciiz "Enter an Integer :: "
	msg2: .asciiz "Number :: "
.text
# Printing the string 
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5 # taking input of int type
	syscall
	
	move $t0, $v0
	sw $t0, testInt # storing the value in the variable
	
	mul $t0, $t0,$t0
	
	la $a0 , msg2
	li $v0 , 4
	syscall
	# Printhing the result 
	li $v0, 1
	move $a0 , $t0 
	syscall
	
	li $v0 , 10
	syscall
	# End the Program