.data
	org: .asciiz "\nOriginal array is :: "
	rev: .asciiz "\nReversed array is  :: "
	com: .asciiz " , "
	array: .double 78.0,23.0,56.0,87.0,65.0,12.0,45.0,65.0,12.0,45.0 
	N: .double 10.0
.text
	la $t0, array		# storing the address of array
	l.d $f4 , N 		# getting the size of array
	li $t2, 0 		# counter
	mtc1.d $t2, $f16 
	cvt.d.w $f16, $f16	# converting counter in double 
	
	li $t2, 1
	mtc1.d $t2, $f8 
	cvt.d.w $f8, $f8	# increment value in double  
	
	li $v0, 4
	la $a0, org
	syscall
print:
	l.d $f6, 0($t0)		# loading the element
	li $v0, 3
	mov.d $f12, $f6
	syscall			# printing the element 
	li $v0, 4
	la $a0, com
	syscall
	addi $t0, $t0, 8	# incremnt in address
	
	add.d $f16, $f16 ,$f8	# increment in counter
	
	c.lt.d $f16,$f4 	# if $f16 < $f4 then loop1
	bc1t print

	la $t0 , array # loading address of array
	la $t1, array  # holding the address of last element
	add $t1, $t1,72 #  passing the location of last element
# making half size in order to reverse the array	
	li $t2, 2 
	mtc1.d $t2, $f16 
	cvt.d.w $f16, $f16
	div.d $f4, $f4, $f16  # making half
	
	li $t2, 0 
	mtc1.d $t2, $f16 
	cvt.d.w $f16, $f16   # f16 counter register
	
	
loop :
	l.d $f10, 0($t0) 	# getting the first element
	l.d $f6 , 0($t1)	# getting the last element 
	s.d $f10, 0($t1)	# storing the first element at last
	s.d $f6 , 0($t0)	# storing the last elemnt at first
	
	addi $t0, $t0, 8	# incremt 8 in address for getting the second element
	sub $t1 , $t1, 8		# dicremnt 8 in address for getting the second last elemnt
	
	add.d $f16, $f16 ,$f8	# increment in counter
	c.lt.d $f16,$f4 	# checking if $f16 < $f4 then move to loop
	bc1t loop
	
	la $t0, array		# storing the address of array
	l.d $f4 , N 		# getting the size of array
	li $t2, 0 		# counter
	mtc1.d $t2, $f16 
	cvt.d.w $f16, $f16	# converting counter in double 

	li $v0, 4
	la $a0, rev
	syscall
rev_print:
	l.d $f6, 0($t0)		# loading the element
	li $v0, 3
	mov.d $f12, $f6
	syscall			# printing the element 
	
	li $v0, 4
	la $a0, com
	syscall
	addi $t0, $t0, 8	# incremnt in address
	
	add.d $f16, $f16 ,$f8	# increment in counter
	
	c.lt.d $f16,$f4 	# if $f16 < $f4 then loop1
	bc1t rev_print

	
exit:
li $v0 , 10
syscall
