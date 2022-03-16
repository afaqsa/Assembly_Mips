.data
	Array:  .word 10,18,12,13
 		.word 20,21,28,23
 		.word 32,31,34,33
 		.word 40,41,42,48
		.word 50,51,52,55
 		.word 60,61,66,63
 		.word 70,71,76,73
 		.word 80,88,82,83
 		.word 90,94,92,93
 		.word 99,96,97,98
 	mess: .asciiz "\n Higest Marks of student " 
 	mess2: .asciiz " :: "
 .text
 	la $t0, Array
 	li $t1, 0 	# column no
 	li $t2, 0 	# Row no
 	li $a1, 0	# total Rows
 	#li $t4, 4	# total columns
 	j loop
 row_inc:
 	add $t2, $t2,1
 	li $v0,4
 	la $a0, mess
 	syscall
 	li $v0, 1
 	move $a0, $t2
 	syscall
 	li $v0,4
 	la $a0, mess2
 	syscall
 	li $v0, 1
 	move $a0, $a1
 	syscall
  	
  	li $t1, 0
 loop:
 	bge $t2,10, exit
 	
 	mul $t5, $t2, 4
 	add $t5, $t5, $t1
 	mul $t5, $t5, 4
 	add $t5, $t5, $t0
 	j print
 col_inc:
 	add $t1, $t1, 1	
 	add $t5, $t5, 4
 print:
 	bge $t1, 4,  row_inc
 	lw $t6, ($t5)
 	bgt $t6 , $a1,change
 	j col_inc
 
 change:
 	move $a1,$t6
 	j col_inc
 
 exit:
 li $v0, 10
 syscall
 	