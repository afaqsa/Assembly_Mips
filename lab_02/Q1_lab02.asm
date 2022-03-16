.data
	Eng: .word 65
	Mat: .word 90
	Sci: .word 90
	Urdu: .word 80
	sub1: .asciiz "English : \t"
	sub2: .asciiz "Math : \t\t"
	sub4: .asciiz "Urdu: \t\t"
	sub3: .asciiz "Science : \t"
	title1:.asciiz "Subjects: \t"
	title2: .asciiz "Gained: \t"
	title3: .asciiz "Out-of: \n"
	title4: .asciiz "Total: \t\t"
	tab: .asciiz "\t\t"
	line: .asciiz "===================================================\n"
	new_line: .asciiz "\n" 
	num: .asciiz "Total Numbers "
	sub_num: .asciiz "400"
.text
# loading value from Storage
lw $t0, Eng
lw $t1, Mat
lw $t2, Sci
lw $t3, Urdu
li $t5, 100
li $t6, 400

# Printing titels 
la $a0, title1
li $v0, 4
syscall

la $a0, title2
li $v0, 4
syscall
la $a0, title3
li $v0, 4
syscall
la $a0, line
li $v0, 4
syscall
#-----------------------
#printing Subjects name and their marks
la $a0, sub1
li $v0, 4
syscall

li $v0 , 1
move $a0, $t0
syscall

la $a0, tab
li $v0, 4
syscall

li $v0 , 1
move $a0, $t5
syscall

la $a0, new_line
li $v0, 4
syscall

la $a0, sub2
li $v0, 4
syscall

li $v0 , 1
move $a0, $t1
syscall

la $a0, tab
li $v0, 4
syscall

li $v0 , 1
move $a0, $t5
syscall

la $a0, new_line
li $v0, 4
syscall

la $a0, sub3
li $v0, 4
syscall

li $v0 , 1
move $a0, $t2
syscall

la $a0, tab
li $v0, 4
syscall

li $v0 , 1
move $a0, $t5
syscall

la $a0, new_line
li $v0, 4
syscall

la $a0, sub4
li $v0, 4
syscall

li $v0 , 1
move $a0, $t3
syscall

la $a0, tab
li $v0, 4
syscall

li $v0 , 1
move $a0, $t5
syscall

la $a0, new_line
li $v0, 4
syscall

syscall
add $t0 , $t1, $t0
add $t2 , $t2 , $t3
add $t0 , $t0 , $t2

la $a0, line
li $v0, 4
syscall
la $a0, title4
li $v0, 4
syscall

li $v0 , 1
move $a0, $t0
syscall

la $a0, tab
li $v0, 4
syscall

li $v0 , 1
move $a0, $t6
syscall

li $v0, 10
syscall
