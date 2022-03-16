.data 
# Declaring the Variables....
	x: .word 0
	y: .word 0
	z: .word 0
	a1: .word 0
	b1: .word 0
	c1: .word 0
	str_x: .asciiz "Enter the Value of X :: "
	str_y: .asciiz "Enter the Value of Y :: "
	str_z: .asciiz "Enter the Value of Z :: "
	ans_a1: .asciiz "\nValue of a1 :: "
	ans_b1: .asciiz "\nValue of b1 :: "
	ans_c1: .asciiz "\nValue of c1 :: "
.text
# Printing the String
	la $a0 , str_x
	li $v0, 4
	syscall
# taking the input from user of int data type  for X
	li $v0 , 5 
	syscall
	sw $v0 , x # storing the value in variable x
	
	la $a0 , str_y
	li $v0, 4
	syscall
# taking the input from user of int data type for Y
	li $v0 , 5
	syscall
	sw $v0 , y # storing the value in variable y
	
	la $a0 , str_z
	li $v0, 4
	syscall
# taking the input from user of int data type for z
	li $v0 , 5
	syscall
	sw $v0 , z # storing the value in variable z
# load the values from variables 
	lw $t0 , x
	lw $t1 , y
	lw $t2 , z
# applying the calculations (a1 = x * y + z )
	mul $t3 , $t0 , $t1
	add $t3 , $t3 , $t2
	
	sw $t3 , a1  # storing the value in variable a1
# (b1 = x + y * z )
	mul $t3 , $t1 ,$t2
	add $t3 , $t0 , $t3
	
	sw $t3 , b1 # storing the value in variable b1
# (c1 = x * y - z )
	mul $t3 , $t0 ,$t1
	sub $t3 , $t3 , $t2
	
	sw $t3 , c1 # storing the value in variable c1
# loading values from variables
	lw $t0 , a1
	lw $t1 , b1
	lw $t2 , c1
# Printing the Result :: 
	la $a0 , ans_a1
	li $v0 ,4
	syscall
	
	li $v0 , 1
	move $a0 , $t0
	syscall
	
	la $a0 , ans_b1
	li $v0 ,4
	syscall
	
	li $v0 , 1
	move $a0 , $t1
	syscall
	
	la $a0 , ans_c1
	li $v0 ,4
	syscall
	
	li $v0 , 1
	move $a0 , $t2
	syscall
	
	li $v0 , 10
	syscall
	# End the Program 