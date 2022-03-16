# Q1 Program for solving expression
# ((32+52)+58*3)+57

.data

.text
# Initialising registers

li $t0 ,32
li $t1 ,52
li $t2 ,58
li $t3 ,3
li $t4 ,57

# solving first all brikes

add $t0, $t0, $t1		#saving result in first register which is t0
mul $t2, $t2, $t3		#saving result in first register which is t0
add $t0, $t0, $t2		#saving result in first register which is t0
add $t0, $t0, $t4		#saving result in first register which is t0

# Printing value 
li $v0 , 1		# 1 is for integer value 
move $a0, $t0		# a0 is for integer value and we are passing the address of $t0 into $a0
# last result should be 315...

syscall			# for system call 
li $v0, 10		# 10 is for program end 
syscall 

# End the Program 