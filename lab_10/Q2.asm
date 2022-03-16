.data
	filename:	.asciiz "D:/para.txt" 
	fileword: 	.space 1024
	words: 		.asciiz "\n Total Words are :: "
.text
	li $t1, 0  # word counter
	la $t0, fileword
	move $t2, $t0
	add $t2, $t2, 1
	
	jal ReadFromFile # calling File Reading function
	
	jal CountWords # calling Word counter Function
	
	li $v0, 4
	la $a0, fileword  # Printing the data which present in file 
	syscall
	
	li $v0, 4
	la $a0, words	# Print the message 
	syscall
	
	li $v0, 1
	move $a0, $t1   # printing the number of words
	syscall
	
	li $v0, 10	# ending the Program 
	syscall
	
ReadFromFile:
	li $v0, 13 # open file
	la $a0, filename # file name loading
	li $a1, 0 # reading file
	syscall
	move $s0, $v0 # file descriptor
	li $v0, 14 # read from file
	move $a0, $s0 # file descriptor
	la $a1, fileword # buffer holding string of whole file
	li $a2, 1024 # size of buffer
	syscall
	
	li $v0, 16 # close file
	move $a0, $s0
	syscall
	jr $ra
	
removeStartingSpace:
	add $t0, $t0, 1
	add $t2 , $t2, 1
# staeting lable will neglect the all starting spaces 
CountWords:
	lb $t3, 0($t0)
	beq $t3, ' ',removeStartingSpace
	j StartCounting
	
# this will check that where is space is pressent
check_space:
	beq $t3 , ' ', checkNextChar
	beq $t3, '\n' , increment
	j nextChar
# this will check that if there is more then one space in a line then accept only the last one
checkNextChar:
	bne $t4 , ' ' , increment
	j nextChar
# this is main loop 
StartCounting:
	lb $t3, 0($t0)
	lb $t4 ,0($t2)
	beq $t4 , '\0', total # check the string is ended or not
	j check_space

increment:
	
	add $t1, $t1, 1		# if it get one word then increment by one
	
nextChar:
	add $t0, $t0, 1		
	add $t2 , $t2, 1
	j StartCounting
total:
	beq $t3, ' ', return	# checking that the last word is already counted or not
	add $t1, $t1, 1
return:
 	jr $ra