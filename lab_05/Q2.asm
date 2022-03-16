.data 
	char_arr: .byte 'D','H','A',' ','S','u','f','f','a'
.text
	la $t0 ,char_arr
	li $t1, 9
	li $t2, 0
	
	add $t0, $t0, 8
loop:
	bge $t2, $t1, exit
	lb $t3, ($t0)  
	
	li $v0, 11
	move $a0, $t3
	syscall
	addi $t2, $t2,1
	sub $t0,$t0,1
	
	j loop
exit:
	li $v0, 10
	syscall
