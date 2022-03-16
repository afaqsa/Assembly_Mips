.data 
	msg: .asciiz "Enter the String :: "
	input: .space 1024
	msg2: .asciiz "Total numbers of words are :: "
	newline: .asciiz "\n"
.text
# printing the message
	la $a0, msg
	li $v0, 4
	syscall
# Taking input from user of string type
	la $a0, input
	li $a1, 1024
	li $v0, 8
	syscall
	
	move $t0, $a0	# copying the address in $t0
	move $t2 , $a0	# copying the address in $t2
	add $t2, $t2, 1	# add one in $t2 in order two check next character also
	j starting
basecase:
	add $t0, $t0, 1
	add $t2 , $t2, 1
# staeting lable will neglect the all starting spaces 
starting:
	lb $t3, 0($t0)
	beq $t3, ' ',basecase
	j Loop
# this will check that where is space is pressent
check_space:
	beq $t3 , ' ', checkNextChar
	j nextChar
# this will check that if there is more then one space in a line then accept only the last one
checkNextChar:
	bne $t4 , ' ' , increment
	j nextChar
# this is main loop 
Loop:
	lb $t3, 0($t0)
	lb $t4 ,0($t2)
	beq $t4 , '\0', total # check the string is ended or not
	j check_space

increment:
	add $t1, $t1, 1		# if it get one word then increment by one
nextChar:
	add $t0, $t0, 1
	add $t2 , $t2, 1
	j Loop
total:
	beq $t3 , '\0' , show	# base case if staring is is null then i
	add $t1, $t1, 1
	j show
show:
	la $a0, msg2
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
