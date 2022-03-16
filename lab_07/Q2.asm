.data 
	msg: .asciiz "Enter the string : "
	msg1: .asciiz "The total number of vowels are :: "
	input: .space 300
.text
	li $t1, 0	# vowel counter
# print the message
	la $a0, msg
	li $v0 , 4
	syscall
# taking inout of string type
	la $a0, input
	li $a1, 300
	li $v0, 8
	syscall
	
	move $t0, $a0	# moving the address of string in $t0
	j Loop
# checking the current character is vowel or not of it's a vowel then move to increment
check_vowel:
	beq $t3, 'a' , increment
	beq $t3, 'e', increment
	beq $t3, 'i' , increment
	beq $t3, 'o', increment
	beq $t3, 'u' , increment
	beq $t3, 'A', increment
	beq $t3, 'E' , increment
	beq $t3, 'I', increment
	beq $t3, 'O' , increment
	beq $t3, 'U', increment
	j nextChar

Loop:
	
	lb $t3, 0($t0)		# loading character 
	beq $t3 , '\0', show	# checking that the string is ended or not
	j check_vowel		

increment:	
	add $t1, $t1, 1		# if vowel then increment in vowel counter
nextChar:
	add $t0, $t0, 1
	j Loop
show:
# printing message 
	la $a0, msg1
	li $v0, 4
	syscall
# printing the result 	
	move $a0, $t1
	li $v0, 1
	syscall
# ending the programe	
	li $v0, 10
	syscall
# Ended the programe 
