.data
# Declaring the Varibles
	lenght: .word 0
	width: .word 0
	area: .word 0
	msg:  .asciiz "Enter the width of Rectangle :: "
	msg1: .asciiz "Enter the lenght of Rectangle :: "
	msg2: .asciiz "Area of Rectangle is :: "
.text
#printhing the String
	la $a0 , msg
	li $v0 , 4
	syscall
	
	li $v0 , 5 # taking the input width of Int Type
	syscall
	
	sw $v0 , width # storing the value in variable for re-use
	
	la $a0 , msg1
	li $v0 , 4
	syscall
	
	li $v0 , 5 # taking the input lenght of int type 
	syscall
	
	sw $v0 , lenght # storing the value in variable
	#Load the values from the memory / varibles 
	lw $t0 ,width 
	lw $t1 , lenght
	# Calculating the area 
	mul $t0 , $t0 , $t1
	sw $t0 , area #stroing the calculating value in variable
	
	la $a0 , msg2
	li $v0 , 4
	syscall
	#printing the result
	move $a0 , $t0
	li $v0 , 1
	syscall
	
	li $v0 , 10
	syscall
	# End the Program