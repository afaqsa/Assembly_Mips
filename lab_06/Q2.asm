
# (n-1)^n-1 + (n-2)^n-2 + ......... + (n-n)^n-n
.data
	out_msg: .asciiz "Enter any number :: "
	out_msg2: .asciiz "The Total Sum is ::  "
.text
	li $t4 , 0		# for calculating the sum
# printing message
	la $a0, out_msg
	li $v0, 4
	syscall
# taking input of integer type
	li $v0, 5
	syscall
	move $t0, $v0  		# storing value in $t0
# the outer loop will run until the user input number not become's 0
outer:
	li $t3, 1		# for calculating power
	beq $t0,0, show		# checking the condition if user input is zero then goto show lable
	sub $t0, $t0, 1		# decreasing the user input value
	move $t2, $t0		# making a copy for calculating the power
# inner loop will calculating the power of each number
inner:
	ble $t2, 0 , sum	# if $t2 is less then equals to 0 then move to sum lable 
	mul $t3, $t3, $t0	# pow = pow * base
	sub $t2 , $t2, 1	# decreasing the  value
	j inner
# sum lable will add numbers 
sum:
	add $t4, $t4, $t3
	j outer		
show:
# printing the message
	la $a0, out_meg2
	li $v0, 4
	syscall
# printing the result / adding of all numbers
	move $a0, $t4
	li $v0, 1
	syscall
# ending the programe	
	li $v0, 10
	syscall
# Programe is Ended