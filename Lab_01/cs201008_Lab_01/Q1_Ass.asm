# Q1 Program for solving expression
# ((52*8)*12+8)-(18+116)+(15*2))

.data

.text
# Initialising registers

li $t0 ,52
li $t1 ,8
li $t2 ,12
li $t3 ,8
li $t4 ,18
li $t5 ,116
li $t6 ,15
li $t7 ,2

# first for ((52*8)*12+8) -> eq 1
# solving first all brikes

mul $t0, $t0, $t1		#saving result in first register which is t0
mul $t0, $t0, $t2		#saving result in first register which is t0
add $t0, $t0, $t3		#saving result in first register which is t0

# Now for (18 + 116) + (15*2)   -> eq 2
# solving first all brikes

add $t4 , $t4, $t5		#saving result in first register which is t4
mul $t6, $t6, $t7		#saving result in first register which is t6

# for adding both
sub $t4, $t4,$t6		#saving result in first register which is t4

#Now subtracting eq 1 and eq 2
sub $t0 , $t0, $t4		#saving result in first register which is t0

# Printing value 
li $v0 , 1		# 1 is for integer value 
move $a0, $t0		# a0 is for integer value and we are passing the address of $t0 into $a0

# last result should be 4896...

syscall			# for system call 
li $v0, 10		# 10 is for program end 
syscall 

# End the Program 



