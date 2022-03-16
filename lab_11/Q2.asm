.data
	enter: .asciiz "Entr the number more the 1 digits :: "
	out: .asciiz "\nThe reverse number is :: "
.text
# printing the message
	li $v0, 4
	la $a0, enter
	syscall
# getting the integer from user
	li $v0, 5
	syscall
	
	move $t0, $v0
rev: 
	ble $t0, 0, print  # number is less then or equals to 0	
	rem $t1, $t0, 10	# taking reminder	
	div $t0, $t0, 10	# dividing the original number to 10
	mul $t2, $t2, 10	# multipling the previous reminder by 10
	add $t2, $t2, $t1	# add current remider in previous reminder
	j rev
print:
# printing the message
	li $v0, 4
	la $a0, out
	syscall
# printing the values values 
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	# ended the program 