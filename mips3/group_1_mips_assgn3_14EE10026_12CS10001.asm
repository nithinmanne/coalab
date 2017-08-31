.data
inp:
	.asciiz "Enter three positive integers m, n and s:\n"
outf:
	.asciiz "Entered Number is not a Perfect Number\n"
outt:
	.asciiz "Entered Number is a Perfect Number\n"

.text
.globl main
main:

	jal initstack

	la $a0, inp 		#$a0 -> address of 'inp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'inp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#m can be accessed at -4($fp)

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#n can be accessed at -8($fp)

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#s can be accessed at -12($fp)

 	
 	b end

 	pryes:
 		la $a0, outt 		#$a0 -> address of 'outt'
 		li $v0, 4			#syscall code for printing string
 		syscall

 	end: b end

initstack:
	#Initialize Stack and Frame Pointers

	addi $sp, $sp, -4  	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $fp, 0($sp)   	# Save $a0 to stack
	move $fp, $sp

	jr $ra

push:
	#$a0 -> to be pushed to stack

	addi $sp, $sp, -4  	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $a0, 0($sp)   	# Save $a0 to stack

	jr $ra