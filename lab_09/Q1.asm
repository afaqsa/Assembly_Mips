.data
	base: .asciiz "Enter the base number :: "
	pow: .asciiz "Enter the power of base :: "
	ans: .asciiz "Answer is  :: "
.text
	li $v1, 1
# Print String 
	la $a0, base
	li $v0, 4
	syscall
# taking input from user 
	li $v0, 5
	syscall
	move $t0, $v0
# printing the String
	la $a0, pow
	li $v0, 4
	syscall
# taking input from user	
	li $v0, 5
	syscall
	move $t1, $v0
	
	jal power # calling power function
# print the anser string
	la $a0, ans 
	li $v0, 4
	syscall
#printing the result
	li $v0, 1
	move $a0, $v1
	syscall 
	li $v0, 10
	syscall
#/////////////////// Start of POWER Function ///////////////////////////
power:
	sub $sp, $sp, 4  
	sw $ra,0($sp) 	#Storing the lable address in stack
	
	beq $t1, 0 , basecase # Checking the base condition 
	sub $t1, $t1, 1	
	jal power	#calling power function again 
	mul $v1, $v1, $t0  # calculation power pow = pow * base
	
basecase:
	lw $ra , ($sp)	# pop lable address from stack
	add $sp, $sp, 4 # move to next lable 
	jr $ra 
#////////////// End of Function ////////////////////////
	
	
	
	
	
	
