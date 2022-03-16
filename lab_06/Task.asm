.data
	newline: .asciiz "\n"
	star: .asciiz "*"
	dollar: .asciiz "$"
	space: .asciiz " "
	out_msg: .asciiz "Enter the Numbers of rows :: "
.text
# printig the message
	la $a0, out_msg
	li $v0, 4
	syscall
# Taking input from user of integer type
	li $v0, 5
	syscall

	move $t0, $v0		# storing the total number of rows in $t0
	li $t1 , 0		# set counter let say i
	j outerloop
# newLine lable will print a new linew after each loop
newLine:
# printing the new line
	la $a0, newline
	li $v0, 4
	syscall
# outer loop will run until the $t1 (i) not grater than  the number of rows
outerloop:
	add $t1, $t1, 1		# increament in counter (i)
	bgt $t1, $t0 , exit	# checking i is grater then numbers of rows if yes then goto exit
	mul $t3, $t1, 2		# making condition for inner loop (2*i -1) for triangle
	rem $t4, $t1, 2		# taking reminder of row in order to check row is even or odd
	move $t2, $t1		# making another counter of inner loop let sy j here j = i
# this inner loop will print space in triangle formate
inner:
	bge $t2, $t0, set	# chaking the counter j is greater than and equals to  number of rows if yes than goto set
# printing space 
	la $a0, space
	li $v0, 4
	syscall
	add $t2, $t2, 1		#increment in counter j
	j inner
# set lable reset the values in  registers
set:
	li $t2, 1		# set counter (j) = 1 for printing * or $ 
	beq $t4, 0 , print_d	# checking the row is even or odd if it is even than print Dollar otherwise print star
	la $a0, star		# loading address of star form data
# print is a second nasted loop of outer loop it's print the star of Dollor
print:
	bge $t2, $t3 , newLine	# checking that $t2 is grater than equals to $t3 ->(2*i)
# printing the symbole
	li $v0, 4
	syscall
	add $t2, $t2, 1		# increment in counter j
	j print
# print_d lable will load the address of dollor symbole from data
print_d:
	la $a0, dollar
	j print 	#move to print loop

exit:
# ending the Programe 
	li $v0, 10
	syscall
# Programe is Ended
	
	
	
