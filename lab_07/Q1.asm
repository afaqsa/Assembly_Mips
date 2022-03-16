.data
	msg: .asciiz "Enter the String : "
	input: .space 30
	reverse: .space 30
	leng: .word 0
	msg2: .asciiz "It's not a palindrome"
	pal: .asciiz "It's a palindrome"
	newline: .asciiz "\n"
	
.text
	li $t3 ,-1 		# String lenght counter
	
	la $t4 , reverse	# holding the address of  that for storing the reverse string
# printing the message
	la $a0, msg
	li $v0, 4
	syscall
# taking input from user of string type
	la $a0, input
	li $a1, 30
	li $v0, 8
	syscall
	
	move $t0, $a0		# copy the address of string variable in $t0
# countlen lable count the lenght of string 
countlen:
	lb $t2 , ($t0)
	beq $t2, '\0', setData	# if $t2 is equals to null then goto setdata
	addi $t3, $t3, 1
	addi $t0, $t0, 1
	j countlen
# setData will reset the values of registers
setData:
	move $t0, $a0		#again copy the address of string variable in $t0
	add $t0, $t0, $t3	# adding the the leght in address in order to get last character of strig
	la $t1 , leng		
	sw $t3, ($t1)		# storing the lenght in data in order to use letter
	div $t3, $t3,2		# dividing the lenght by 2 in order to reverse the half string 
# reverse lable will revers the half string
reversed:
	blt $t3, 0, check	# base case checking the lenght is less than 0 then move to check
	lb $t5 , ($t0)		# loading character from memory
	sb $t5,  0($t4)		# storing the character in the address of second variable which is reverse
	sub $t0, $t0, 1		# decrement in address of user input string 
	add $t4, $t4, 1		# increment in address of reverse string variable
	sub $t3, $t3, 1		# decrement the lenght of string
	j reversed
# check lable will set the registers
check:
	la $t0 , input		# storing the address of user input string in $t0
	la $t2, reverse		# storing the address of reverse string in $t2
	lw $t3, ($t1)		# loading lenght from memory in $t3
	div $t3, $t3,2		# dividing lenght in order to check half string
	j paldorm
#condition will check its palindrome or not
condition: 
	bne $t5, $t1, notpalindrome	# checking if any character is not equals then its not a palindrome
	add $t0, $t0, 1
	add $t2, $t2, 1
	sub $t3, $t3 ,1
paldorm:
	blt $t3, 1, ispalindrome 	# checking if lenght of string is less then 1 than it's a palindrome
	lb $t5 , ($t0)
	lb $t1 , 1($t2)
	b condition	
ispalindrome: # loading the address 
	la $a0, pal
	j exit
notpalindrome:# loading the address 
	la $a0, msg2
exit:
# printing the result 
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
# Program is ended
	
