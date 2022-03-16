.data 
	diam: .asciiz "  *  \n *** \n*****\n *** \n  *  \n"
.text

la $a0, diam
li $v0 , 4
syscall

li $v0,10
syscall