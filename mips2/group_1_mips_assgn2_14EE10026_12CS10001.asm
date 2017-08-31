#Finding the k-th Largest number
#Group 1
#Manne Naga Nithin 14EE10026
#A Gopi 12CS10001


.data
kinp:
	.asciiz "Enter the value of k: "
ninp:
	.asciiz "Enter the count of elements to be read: "
inva:
	.asciiz "Invalid since k>n"
ainp:
	.asciiz "Enter the elements one by one:\n"
out1:
	.asciiz "The "
out2:
	.asciiz "-th largest number among [ "
comma:
	.asciiz ", "
out3:
	.asciiz " ] is:"
newl:
	.asciiz "\n"

.text
.globl main
main:
	
	jal initstack

	la $a0, kinp 		#$a0 -> address of 'kinp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'kinp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#k can be accessed at -4($fp)

 	la $a0, ninp 		#$a0 -> address of 'ninp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'ninp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $a0
 	jal push			#Calling Routine used to store $a0 into stack
 						#n can be accessed at -8($fp)

 	lw $t0, -8($fp)		#Check validity of n and k
 	lw $t1, -4($fp)		#n should be greater than k
 	bge $t0, $t1, vala

 	la $a0, inva 		#$a0 -> address of 'inva'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'inva'
 	b end

 	vala:
 	la $a0, ainp 		#$a0 -> address of 'ainp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'ainp'

 	lw $t0, -8($fp)
 	aloop:					#Loop for getting the n values of a
 		li $v0, 5			#syscall code for getting integer input
 		syscall				#syscall for getting input into $v0
 		move $a0, $v0		#Storing in $a0
 		jal push			#Calling Routine used to store $a0 into stack
 		addi $t0, $t0, -1	#Decrementing $t0
 		bgtz $t0, aloop

 	la $a0, out1 		#$a0 -> address of 'out1'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'out1'

 	lw $a0, -4($fp) 	#$a0 -> value of 'k'
 	li $v0, 1			#syscall code for printing integer
 	syscall				#syscall for printing 'k'

 	la $a0, out2 		#$a0 -> address of 'out2'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'out2'

 	lw $t0, -8($fp)
 	b nocomma
 	ploop:				#Loop to print all n values iterates from n-1 to 0
 		la $a0, comma 		#$a0 -> address of 'comma'
 		li $v0, 4			#syscall code for printing string
 		syscall				#syscall for printing 'comma'
 		nocomma:
 		lw $a0, -8($fp) 	#$a0 -> n
 		sub $a0, $a0, $t0	#$a0 = n-i
 		jal geti
 		move $a0, $v0		#$a0 = a[i]
 		li $v0, 1			#syscall code for printing integer
 		syscall				#syscall for printing 'a[i]'
 		addi $t0, $t0, -1	#Decrementing $t0
 		bgtz $t0, ploop

 	la $a0, out3 		#$a0 -> address of 'out3'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'out3'

 	jal bubsort

 	lw $a0, -4($fp) 	#$a0 -> value of 'k'
 	addi $a0, $a0, -1	#$a0 = k-1 because indexes from 0
 	jal geti 			#Gets k'th largest since desending sorted
 	move $a0, $v0		#$a0 = a[k]
 	li $v0, 1			#syscall code for printing integer
 	syscall				#syscall for printing 'k'

 	la $a0, newl 		#$a0 -> address of 'newl'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'newl'

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

geti:
	#a0 -> index i of element to be gotten
	#v0 -> returns a[i]

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack

	move $t0, $a0		#a[i] is accessible at $fp - 12 - 4*i [Starting with index 0]
	add $t0, $t0, $t0	#Doubling i
	add $t0, $t0, $t0	#Quadrupling i
	addi $t0, $t0, 12	#$t0 = 4*i + 12
	sub $t0, $fp, $t0	#$t0 = $fp - 4*i - 12
	lw $v0, 0($t0)		#$v0 = a[i]

	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra

swapi:
	#a0 -> index i of element to be swapped with i-1

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t0, 0($sp)		# Save $t0 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t1, 0($sp)		# Save $t1 to stack
	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $t2, 0($sp)		# Save $t2 to stack

	move $t0, $a0		#a[i] is accessible at $fp - 12 - 4*i [Starting with index 0]
	add $t0, $t0, $t0	#Doubling i
	add $t0, $t0, $t0	#Quadrupling i
	addi $t0, $t0, 12	#$t0 = 4*i + 12
	sub $t0, $fp, $t0	#$t0 = $fp - 4*i - 12
	lw $t1, 0($t0)		#$t1 = a[i]
	lw $t2, 4($t0)		#$t2 = a[i-1]
	sw $t2, 0($t0)		#a[i] = $t2
	sw $t1, 4($t0)		#a[i-1] = $t1

	lw $t2, 0($sp)		# Pop $t2 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t1, 0($sp)		# Pop $t1 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
	lw $t0, 0($sp)		# Pop $t0 from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra

bubsort:
	#Routine used to bubblesort the array stored in stack

	addi $sp, $sp, -4	# Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
	sw $ra, 0($sp)		# Save $ra to stack

	lw $t0, -8($fp)		#Initialize count for outer loop
	addi $t0, $t0, -1	#$t0 = n-1
	bloop1:					#Bubble sort outer loop
		lw $t1, -8($fp)		#Initalize count for inner loop
		addi $t1, $t1, -1	#$t1 = n-1

		bloop2:				#Bubble sort inner loop
			move $a0, $t1		#$a0 = i -> Iterates from n-1 to 1
			jal geti 			#gets value of a[i]
			move $t2, $v0		#$t2 = a[i]
			addi $a0, $a0, -1	#$a0 = i-1
			jal geti 			#gets value of a[i-1]
			bge $v0, $t2, noswap
			addi $a0, $a0, 1	#$a0 = i
			jal swapi			#Swaps a[i] and a[i-1] if not a[i-1] is not greater than a[i] -> Descending order
			noswap:
			addi $t1, $t1, -1	#Decrement inner loop counter
			bgtz $t1, bloop2	#Check inner loop counter

		addi $t0, $t0, -1	#Decrement outer loop counter
		bgtz $t0, bloop1	#Check outer loop counter

	lw $ra, 0($sp)		# Pop $ra from stack
	addi $sp, $sp, 4	# Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

	jr $ra