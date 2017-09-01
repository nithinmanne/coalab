.data
inp:
	.asciiz "Enter three positive integers m, n and s:\n"
aout:
	.asciiz "Array A:\n"
bout:
	.asciiz "Array B:\n"
space:
	.asciiz "\t"
newl:
	.asciiz "\n"

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

 	li $a0, 2		#malloc 2 for storing address of A and B
 	jal malloc 			#Can be directly addressed at -16($fp) and -20($fp)
 	move $t0, $v0		#$t0 has the address of the memory address location

 	lw $t1, -4($fp)		#$t1 = m
 	lw $t2, -8($fp)		#$t2 = n
 	mul $t3 ,$t1, $t2	#$t3 = m*n
 	move $a0, $t3
 	jal malloc 			#Allocating m*n locations for array A
 	sw $v0, -16($fp)		#Storing the address of array
 	move $t4, $v0

 	lw $t0, -12($fp)		#Initialize $t0 = s
 	li $t5, 330				#Initialize a
 	li $t6, 100				#Initialize c
 	li $t7, 481				#Initialize m
 	aloop:					#Loop for getting the m*n values of a
 		sw $t0, 0($t4)		#Storing in memory location
 		mul $t0, $t0, $t5	#$t0 = a*$t0
 		add $t0, $t0, $t6	#$t0 = a*$t0 + c
 		modloop:			#Loop used to calculate modulus
 			blt $t0, $t7, endmod
 			sub $t0, $t0, $t7
 			b modloop
 		endmod:
 		addi $t4, $t4, 4	#Incrementing memory location for next variable
 		addi $t3, $t3, -1	#Decrementing $t3
 		bgtz $t3, aloop

 	la $a0, aout 		#$a0 -> address of 'aout'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'aout'

 	lw $a0, -4($fp)		#$a0 = m
 	lw $a1, -8($fp)		#$a1 = n
 	lw $a2, -16($fp)	#$a2 = address of A

 	jal matPrint

 	lw $t1, -4($fp)		#$t1 = m
 	lw $t2, -8($fp)		#$t2 = n
 	mul $t3 ,$t1, $t2	#$t3 = m*n
 	move $a0, $t3
 	jal malloc 			#Allocating m*n locations for array B
 	sw $v0, -20($fp)	#Storing the address of array

 	lw $a0, -4($fp)		#$a0 = m
 	lw $a1, -8($fp)		#$a1 = n
 	lw $a2, -16($fp)	#$a2 = address of A
 	lw $a3, -20($fp)	#$a3 = address of B

 	jal matTrans

 	la $a0, bout 		#$a0 -> address of 'bout'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'bout'

 	lw $a0, -8($fp)		#$a0 = m
 	lw $a1, -4($fp)		#$a1 = n
 	lw $a2, -20($fp)	#$a2 = address of B

 	jal matPrint

 	end: b end

initstack:
	#Initialize Stack and Frame Pointers

	addi $sp, $sp, -4  	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $fp, 0($sp)   	# Save previous $fp to stack
	move $fp, $sp

	jr $ra

push:
	#$a0 -> to be pushed to stack

	addi $sp, $sp, -4  	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $a0, 0($sp)   	# Save $a0 to stack

	jr $ra

malloc:
	#$a0 -> number of memory locations needed(number of blocks of 4 bytes)
	#$v0 -> returns address of first address

	mallocloop:			#Loop that runs $a0 times
		addi $sp, $sp, -4  	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
		addi $a0, $a0, -1	# Decrement $a0 for loop count
		bgtz $a0, mallocloop

	move $v0, $sp

	jr $ra

matPrint:
	#$a0 -> integer m
	#$a1 -> integer n
	#$a2 -> address of array which is stored in row major

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack

	move $t0, $a0		#Outer loop counter = m
	matPrintouter:
		move $t1, $a1		#Inner loop counter = n
		matPrintinner:
			lw $a0, 0($a2)		#$a0 = a[i] in row major
			li $v0, 1			#syscall code for printing integer
			syscall
			addi $a2, $a2, 4	#Incrementing i
			la $a0, space 		#$a0 -> address of 'space'
 			li $v0, 4			#syscall code for printing string
 			syscall				#syscall for printing 'space'
			addi $t1, $t1, -1	# Decrement $t1 for inner loop count
			bgtz $t1, matPrintinner
		la $a0, newl 		#$a0 -> address of 'newl'
 		li $v0, 4			#syscall code for printing string
 		syscall				#syscall for printing 'newl'
		addi $t0, $t0, -1	# Decrement $t0 for outer loop count
		bgtz $t0, matPrintouter

	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra

matTrans:
	#$a0 -> integer m
	#$a1 -> integer n
	#$a2 -> address of array which is stored in row major
	#$a2 -> address of array where transpose is saved

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t2, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t3, 0($sp)		# Save $t3 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t4, 0($sp)		# Save $t4 to stack

	move $t0, $a0		#Outer loop counter = m
	matTransouter:
		move $t1, $a1		#Inner loop counter = n
		matTransinner:
			lw $t2, 0($a2)		#$t2 = a[i] in row major
			sub $t3, $a0, $t0	#Get index i
			sub $t4, $a1, $t1	#Get index j
			mul $t4, $t4, $a0	#$t4 = m*j
			add $t4, $t4, $t3	#$t4 = m*j + i
			add $t4, $t4, $t4
			add $t4, $t4, $t4	#Quadrupling for address
			add $t4, $a3, $t4	#Address of b[j][i]
			sw $t2, 0($t4)
			addi $a2, $a2, 4	#Incrementing i
			move $t4, $a0		#Saving $a0 as it stores m
			la $a0, space 		#$a0 -> address of 'space'
 			li $v0, 4			#syscall code for printing string
 			syscall				#syscall for printing 'space'
 			move $a0, $t4
			addi $t1, $t1, -1	# Decrement $t1 for inner loop count
			bgtz $t1, matTransinner
		move $t4, $a0		#Saving $a0 as it stores m
		la $a0, newl 		#$a0 -> address of 'newl'
 		li $v0, 4			#syscall code for printing string
 		syscall				#syscall for printing 'newl'
 		move $a0, $t4
		addi $t0, $t0, -1	# Decrement $t0 for outer loop count
		bgtz $t0, matTransouter

	lw $t4, 0($sp)		# Pop $t4 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t3, 0($sp)		# Pop $t3 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t2, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra
