.data
	array:  .word 10,11,12,13
 		.word 20,21,22,23
 		.word 30,31,32,33
 		.word 40,41,42,43
 	space: .asciiz " "
 	new: .asciiz "\n"
 	message: .asciiz "\nOriginal Matrix is :: \n"
 	message2: .asciiz "\n Transpot Matrix is :: \n"
 .text
 	la $t0, array
 	
 	li $v0, 4
 	la $a0, message
 	syscall
 	jal print3
 	li $t1, 0 # column no
 	li $t2, 0 # row no
 	
 	j loop
 row_inc:
 	add $t2, $t2, 1
 	li $t1, 0
 loop:
 	bge $t2, 4, exit
 	mul $t3, $t2,4
 	add $t3, $t3,$t1
 	mul $t3,$t3, 4
 	add $t3, $t3, $t0
 	mul $a1, $a1, 2
 	
 	move $t1, $t2
 	add $t1, $t1,1
 	mul $a1, $t1, 4
 	add $t3, $t3, $a1
 	j loop2
 col_inc:
 	add $t1, $t1, 1
 	add $t3, $t3, 4
 	#add $t4, $t4, 4
 loop2:
 	bge $t1, 4,row_inc
 	#beq $t2,$t1, col_inc
 	
 	mul $t4, $t1, 4
 	add $t4, $t4, $t2
 	mul $t4, $t4, 4
 	add $t4, $t4, $t0
 	#add $t4, $t4, 4
 	lw $t5, ($t4)
 	lw $t6, ($t3)
 	sw $t5, ($t3)
 	sw $t6, ($t4)
 	j col_inc
 exit:
 	li $v0, 4
 	la $a0, message2
 	syscall
 	jal print3
 	li $v0, 10
 	syscall
 
 print3:
 	li $t1, 0
 	li $t2, 0
 	j lop
 row:
 	add $t2, $t2, 1
  	li $t1, 0
  	li $v0, 4
  	la $a0, new
  	syscall
 lop:
 	bge $t2,4, return
 	
 	mul $t3, $t2, 4
 	add $t3, $t3, $t1
 	mul $t3, $t3, 4
 	add $t3, $t3, $t0
 	j print
 col:
 	add $t1, $t1, 1	
 	add $t3, $t3, 4
 print:
 	bge $t1, 4,  row
 	lw $t4, ($t3)
 	li $v0, 1
 	move $a0, $t4
 	syscall
 	li $v0, 4
 	la $a0, space
 	syscall
 	j col
 return:
 jr $ra