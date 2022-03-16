.data
	msg: .asciiz "Enter the String :: "
	msg1: .asciiz "The Largest Word in the string is  :: "
	msg2: .asciiz "\nThe lenght of this word is :: " 
	input: .space 1024
.text
	li $t3, 0	 # character counter in single word
	li $t4, 0	 # Holding largest word lenght  
	li $t0, 0	 # For total lenght of String
# printing message 
	la $a0, msg
	li $v0, 4
	syscall
# taking String as input from user
	la $a0, input
	li $a1, 1024	# string size 
	li $v0, 8
	syscall
	
	jal largestWord		# calling function which check the lenght of largest word
#printing message 
	la $a0, msg1
	li $v0, 4
	syscall
	
	jal PrintWord	# calling function which print the largest world
#printing the message 
	la $a0, msg2
	li $v0, 4
	syscall
# Printing the lenght of largest word
	li $v0, 1
	move $a0, $t4
	syscall
#Ending the Programe
	li $v0, 10
	syscall
# Programe Ended
#//////////////////// Strat of PrintWord function ////////////////////////////////////
	
PrintWord:
	la $t0, input
	add $t0, $t0, $t5 # adding the lenght from where the largest word is starting 
	li $t1, 0 	# set counter 
prin:
# printing the word
	lb $t2, ($t0)	#loading character from string
	move $a0, $t2
	li $v0 , 11
	syscall

	add $t0, $t0, 1 # gatting next character
	add $t1, $t1, 1	# increment in counter
	bne $t1, $t4, prin
	jr $ra

#///////////// End OF PrintWord Function//////////////////////////	

#/////////////////////Start of largestWord /////////////////////////////////////
increment:
	add $t3, $t3, 1  # increment in counter 
nextChar:
 	add $a0 , $a0, 1 # gatting next Character
largestWord:
	lb $t2, 0($a0)	# loading character
	beq $t2, '\n', checklenght	# checking string is ended or not if ened go to checklengt of last word
	beq $t2, ' ', checklenght	
	j increment	# move to increment label

checklenght:
	bgt $t4 , $t3 , reset	# chaking new lenght of word ids greater then or not 
	move $t5, $t0		# it's hold the lenght of string from where the largest word is starting
	move $t4, $t3		# moving the largest word lenght in $t4
reset:
	add $t0, $t0, $t3	# for total lenght of string	
	add $t0, $t0, 1		# including space character
	li $t3 , 0		# resetting the $t3 
	bne $t2 ,'\n' , nextChar	
	jr $ra
#///////////// End OF largestWord Function//////////////////////////	