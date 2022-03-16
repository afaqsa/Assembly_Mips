.data
	filename:	.asciiz "D:/file.txt" 
	name:	  	.asciiz "\nEnter your name : "
	dep: 		.asciiz "\nEnter your Department : "
	uni: 		.asciiz "\nEnter your University : "
	output: 	.asciiz "\nOutput is : \n"
	inputname: 	.space 30
	inputdep: 	.space 30
	inputuni: 	.space 30
	fileword: 	.space 1024
.text
	la $t0,fileword
	
# Printing message 
	li $v0, 4
	la $a0, name
	syscall
# getting Input from user
	la $a0, inputname
	li $a1, 40
	li $v0, 8
	syscall
# Calling store function which store all details in fileword varible
	jal Store	
# Printing message 
	li $v0, 4
	la $a0, dep
	syscall
# getting Input from user
	la $a0, inputdep
	li $a1, 40
	li $v0, 8
	syscall
# Calling store function	
	jal Store
# Printing message 
	li $v0, 4
	la $a0, uni
	syscall
# getting Input from user
	la $a0, inputuni
	li $a1, 40
	li $v0, 8
	syscall
# Calling store function	
	jal Store
	
	jal WriteinFile		# Calling Write in File function
	jal ReadFromFile	# Calling Read From File function
# print string
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4 # print string in file
	la $a0, fileword # load address of buffer
	syscall

	li $v0, 10 # end program
	syscall
	#Program Ended
#//////////////// Store in one Variable////////
increment:
 	sb $t1, ($t0)
	addi $a0, $a0, 1
	addi $t0, $t0, 1
Store:
	lb $t1, ($a0)
	bne $t1,'\0',increment
	jr $ra
# //////////////////////// Write in File Function ////////////////////
WriteinFile:
	li $v0, 13 # open file
	la $a0, filename # loading file name
	li $a1, 1 # mode of writing in file 
	syscall

	move $s0, $v0 # file descriptor

	li $v0, 15 # write in file
	move $a0, $s0 #file descriptor
	la $a1,fileword  # word u want to print
	li $a2, 50 # size of word
	syscall
	j closeFile
#////////////////////// Ended of Write in file function/////////////////

 # ///////////////////////////////////// Start of Read from file Function //////// 
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
# ////////// Ended of Read From file function //////////////////////

#/////////////////////// Close File Function ///////////////////////	
closeFile:
	li $v0, 16 # close file
	move $a0, $s0
	syscall
	jr $ra
# Funtion Ended