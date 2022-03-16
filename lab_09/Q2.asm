.data
	num: .asciiz "Enter number :: "
	prime: .asciiz "It's a prime number..."
	notprime: .asciiz "It's not a prime number..."
.text
# Printing the string
	la $a0, num
	li $v0, 4
	syscall
# thaking input from user
	li $v0, 5
	syscall
	
	move $t2, $v0	
	div $t2, $t2, 2 # the recursion calls n/2 times
	la $a0, prime	# seating a0 as an prime number
	
	jal checkPrime   # calling checkPrime function
	
# Printing the result...
	li $v0, 4
	syscall
	
	li $v0, 10  # ending Program 
	syscall
	#Program is Ended

#/////////////////////////////////////////////////////////////
#checkprime Function
checkPrime:
	sub $sp, $sp, 4
	sw $ra , 0($sp) # storing address of label in stack
	
	bne $t2,1 , recursion #calling recursion until $t2 not equls to 1
	j basecase  
	
recursion:	
	rem $t3, $v0, $t2  # taking reminder 
	beq $t3 , 0 , setNotPrime # checking the reminder is equals to 0 if yes then we will set flag = 0
	sub $t2, $t2, 1 
	jal checkPrime		# recursive call
basecase:
	lw $ra , 0($sp)		#pop the address of lable from stack 
	add $sp, $sp, 4
	jr $ra
	
setNotPrime:
	la $a0, notprime	
	j basecase
#//////////////////////End of Function//////////////////////////////////
	
	
	
		
