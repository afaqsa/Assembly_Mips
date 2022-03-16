.data
	arr: .word 11, 12, 13 ,14, 15
	msg1: .asciiz "\n Value of arr["
	msg2: .asciiz "] is :: "
.text
	la $t0, arr
	li $t1, 5
	li $t2,0
	
loop: 
	bge $t2, $t1 , exit
	
	lw $t3 , ($t0)
	mul $t3 , $t3, 10
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	addi $t2, $t2, 1
	add $t0, $t0 , 4
	j loop
exit:
	li $v0, 10
	syscall
	
	