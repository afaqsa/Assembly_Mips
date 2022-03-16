.data 
	
.text
	li $t0,15
	li $t1 , 0
	li $t2 , ' '
	 
loop:
	blt $t0, $t1 , exit
	
	 li $v0, 1
	 move $a0, $t0
	 syscall
	 
	 li $v0 , 11
	 move $a0, $t2
	 syscall
	 
	 subi $t0, $t0, 2
	  j loop
exit:
	li $v0, 10
	syscall