.data
	out_msg1:.asciiz "Enter the Base number :: "
	out_msg2:.asciiz "Enter the power of Base :: "
.text
	li $t3, 1	# For calculating the result
# printing message 
	la $a0, out_msg1
	li $v0, 4
	syscall
# Taking input of integer type
	li $v0, 5
	syscall
	
	move $t0, $v0		# storing value or base number in $t0
# printing message	
	la $a0, out_msg2
	li $v0, 4
	syscall
# Taking input of integer type	
	li $v0, 5
	syscall
	
	move $t1, $v0		# storing value or power of base number in $t1
	beq $t1, 0 , show	# checking that if pawer is equal to 0 then goto show lable
	beq $t0, 0 , zero	# checking that if base is equal to 0 then goto zero lable
outer:	 
	ble $t1, 0, show	# checking that if power is less equals to 0 then goto show lable
	mul $t3, $t3, $t0	# result = result * base
	sub $t1, $t1, 1		# decriment the power
	j outer
zero:
	li $t3, 0		# if base is zero then then result will be zero
show:
# printing result
	move $a0, $t3		# if power is 0 then the result will be 1 otherwise it shows the calculated result
	li $v0, 1
	syscall
# Ending Programe	
	li $v0, 10
	syscall
# Programe Ended...