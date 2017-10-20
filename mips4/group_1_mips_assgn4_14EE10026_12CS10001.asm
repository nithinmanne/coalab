.data
ninp:
	.asciiz "Enter the order of the square matrix whose determinant is to be found : "
sinp:
	.asciiz "Enter some positive integer for the value of the seed s : "
aout:
	.asciiz "Array\n"
rout:
	.asciiz "The determinant value returned in this invocation is : "
rin:
	.asciiz "The matrix passed on this invocation is :\n"
dout:
	.asciiz "Finally the determinant is : "
space:
	.asciiz "\t"
newl:
	.asciiz "\n"

.text
.globl main
main:

	jal initstack

	la $a0, ninp 		#$a0 -> address of 'ninp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'ninp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#n can be accessed at -4($fp)

 	la $a0, sinp 		#$a0 -> address of 'sinp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'sinp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#s can be accessed at -8($fp)

 	li $a0, 1			#malloc 1 for storing address of array
 	jal malloc 			#Can be directly addressed at -12($fp)

 	lw $t1, -4($fp)		#$t1 = n
 	mul $t3 ,$t1, $t1	#$t3 = n*n
 	move $a0, $t3
 	jal malloc 			#Allocating n*n locations for array A
 	sw $v0, -12($fp)	#Storing the address of array
 	move $t4, $v0

 	lw $t0, -8($fp)			#Initialize $t0 = s
 	li $t5, 330				#Initialize a
 	li $t6, 100				#Initialize c
 	li $t7, 17				#Initialize m
 	aloop:					#Loop for getting the n*n values of a
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

 	lw $a0, -4($fp)		#$a0 = n
 	lw $a1, -12($fp)	#$a1 = address of A

 	jal sqMatPrint

 	lw $a0, -4($fp)		#$a0 = n
 	lw $a1, -12($fp)	#$a1 = address of A

 	jal findDet

 	move $t0, $v0

 	la $a0, dout 		#$a0 -> address of 'dout'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'dout'

 	move $a0, $t0 		#$a0 -> determinant
 	li $v0, 1			#syscall code for printing integer
 	syscall				#syscall for printing determinant

 	li $v0, 10
 	syscall

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

unmalloc:
	#$a0 -> number of addresses to free

	unmallocloop:			#Loop that runs $a0 times
		addi $sp, $sp, 4  	# Increment stack pointer by 4 -> Deallocating memory of 4 bytes = 32 bits
		addi $a0, $a0, -1	# Decrement $a0 for loop count
		bgtz $a0, unmallocloop

	jr $ra

sqMatPrint:
	#$a0 -> integer n
	#$a1 -> address of array which is stored in row major

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t2, 0($sp)		# Save $t2 to stack

	move $t2, $a0		#$t2 = n
	move $t0, $t2		#Outer loop counter = n
	matPrintouter:
		move $t1, $t2		#Inner loop counter = n
		matPrintinner:
			lw $a0, 0($a1)		#$a0 = a[i] in row major
			li $v0, 1			#syscall code for printing integer
			syscall
			addi $a1, $a1, 4	#Incrementing i
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

	lw $t2, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra

findDet:
	#$a0 -> integer n
	#$a1 -> address of array which is stored in row major
	#$v0 -> returns determinant

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $ra, 0($sp)		# Save $ra to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $sp, 0($sp)		# Save $sp to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t2, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t3, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t4, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t5, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t6, 0($sp)		# Save $t2 to stack

	move $t0, $a0
	move $t1, $a1

	la $a0, rin 		#$a0 -> address of 'rin'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'rin'
 	move $a0, $t0
 	jal sqMatPrint
 	move $a0, $t0
 	move $a1, $t1

 	li $t2, 1			#Base case for n=1
 	bne $t0, $t2, findDetNotBase1
 	lw $v0, 0($t1)	#Det = a[0][0]
 	b findDetreturn
 	findDetNotBase1:
 	li $t2, 2		#Base case check for n=2
 	bne $t0, $t2, findDetNotBase2
 	lw $t0, 0($t1)
 	lw $t2, 12($t1)
 	mul $v0, $t0, $t2
 	lw $t0, 4($t1)
 	lw $t2, 8($t1)
 	mul $t0, $t0, $t2
 	sub $v0, $v0, $t0	#det= a[0][0]a[1][1]-a[0][1]a[1][0]
 	b findDetreturn
 	findDetNotBase2:
 	li $t6, 1		#for alternating addition and subtraction
 	move $t0, $a0	#Loop iterator
 	move $t1, $a1	#Address iterator
 	move $t4, $a0	#Temporary storage for n
 	move $t5, $a1	#Temporary storage for address
 	li $t2, 0		#Store determinant
 	findDetloop:
 		lw $t3, 0($t1)			#Get current index value
 		move $a0, $t4			#$a0 -> n
		addi $a0, $a0, -1	#$a0 -> n-1
		mul $a0, $a0, $a0	#$a0 = (n-1)*(n-1)
		jal malloc
		move $a0, $t4			#$a0 -> n
 		move $a1, $t0			#$a1 -> k row iterating upon
 		move $a2, $t5			#$a2 -> address of old array
		move $a3, $v0			#$a3 -> new address
 		jal makeArr
 		move $a0, $v0			#$v0 -> new n = n-1
 		move $a1, $v1			#$v1 -> new array address
 		jal findDet 			#Recursive Call
 		mul $t3, $t3, $v0		#$t3 = value * sub-determinant
 		mul $t3, $t3, $t6		#plus or minus
 		add $t2, $t2, $t3		#add to total
 		li $t3, -1				#invert sign for next time
 		mul $t6, $t6, $t3
		move $a0, $t4			#$a0 -> n
		addi $a0, $a0, -1	#$a0 -> n-1
		mul $a0, $a0, $a0	#$a0 = (n-1)*(n-1)
		jal unmalloc
 		addi $t1, $t1, 4
 		addi $t0, $t0, -1
 		bgtz $t0, findDetloop

 	move $v0, $t2
	findDetreturn:
	move $t2, $v0
 	la $a0, rout 		#$a0 -> address of 'rin'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'rin'
 	move $a0, $t2 		#$a0 -> determinant
 	li $v0, 1			#syscall code for printing integer
 	syscall				#syscall for printing determinant
 	la $a0, newl 		#$a0 -> address of 'newl'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'newl'
 	move $v0, $t2

	lw $t6, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t5, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t4, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t3, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t2, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $sp, 0($sp)		# Pop $sp from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $ra, 0($sp)		# Pop $ra from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra

makeArr:
	#$a0 -> integer n
	#$a1 -> index k to avoid to put
	#$a2 -> address of array which is stored in row major
	#$a3 -> address new array
	#$v0 -> returns new n = n-1
	#$v1 -> returns address

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $ra, 0($sp)		# Save $ra to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $sp, 0($sp)		# Save $sp to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t2, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t3, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t4, 0($sp)		# Save $t2 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t5, 0($sp)		# Save $t2 to stack

	move $t3, $a0		#Store n
	addi $t0, $a0, -1	#$t0 = n-1
	move $t1, $a3		#$t1 = address of new array
	move $v1, $a3		#$v1 = address of new array
	move $v0, $t0		#$v0 = n-1
	move $t0, $t3		#$t0 = n
	move $a0, $t3
	add $t0, $t0, $t0
	add $t0, $t0, $t0		#Quadrupling address
	add $t0, $t0, $a2		#Address iterator
	move $t1, $v0			#Index iterator = n-1
	move $t2, $v1			#New array address iterator
	makeArrouter:
		move $t3, $v0			#Inner loop counter
		addi $t3, $t3, 1	#Inner loop iterator = n
		makeArrinner:
			lw $t4, 0($t0)		#Get word from old array
			addi $t0, $t0, 4	#Increment old array iterator
			beq $a1, $t3, makeArrinnerskip	#Check if skippable row
			sw $t4, 0($t2)		#Storing in new array
			addi $t2, $t2, 4	#Incrementing new array address
			makeArrinnerskip:
			addi $t3, $t3, -1
			bgtz $t3, makeArrinner
		addi $t1, $t1, -1
		bgtz $t1, makeArrouter


	lw $t5, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t4, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t3, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t2, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $sp, 0($sp)		# Pop $sp from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $ra, 0($sp)		# Pop $ra from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra
