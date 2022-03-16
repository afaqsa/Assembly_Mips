#Program for expression solving (Lab task)
#Q1 (9-8)*12+ (16 - 15) - (5 * 2)
.data

.text

# Initialising registers

li $t0 , 9	
li $t1 , 8
li $t2 , 12
li $t3 , 16
li $t4 , 15
li $t5 , 5
li $t6,  2

# solving first all brikes

sub $t0, $t0,$t1 	 #saving result in first register which is t0
sub $t3, $t3, $t4 	 #saving result in first register which is t3
mul $t5, $t5, $t6	 #saving result in first register which is t5

# Now the update equtions is 
# (1)*12+ (1) + (10)

mul $t0, $t0, $t2	 #saving result in first register which is t0
add $t0, $t0, $t3	 #saving result in first register which is t0
sub $t0, $t0 , $t5	 #saving result in first register which is t0

#Now For Printing the result 
li $v0 , 1 		# 1 is for integer value 
move $a0, $t0		# a0 is for integer value and we are passing the address of $t0 into $a0

# last result should be 3...

syscall			# for system call 
li $v0, 10		# 10 is for program end 
syscall 

# End the Program 



