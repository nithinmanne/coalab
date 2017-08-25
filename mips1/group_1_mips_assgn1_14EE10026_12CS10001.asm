.data
inp:
	.asciiz "Enter the Number : "
outf:
	.asciiz "Entered Number is not a Perfect Number\n"
outt:
	.asciiz "Entered Number is a Perfect Number\n"

.text
.globl main
main:
	la $a0, inp 		#$a0 -> address of 'inp'
 	li $v0, 4			#syscall code for printing string
 	syscall				#syscall for printing 'inp'

 	li $v0, 5			#syscall code for getting integer input
 	syscall				#syscall for getting input into $v0
 	move $a0, $v0		#Storing in $t0

 	li $a1, 1			#Used to store prime, will be iterated over

 	li $s0, 0			#Used to store sum of divisors

 	loop:
 		jal retdiv			#calling retdiv returns 1 in $v0 if divisible
 		beqz $v0, skpadd	#only add divisors
 		add $s0, $s0, $a1
 		skpadd:
 		addi $a1, $a1, 1	#increment divisor
 		blt $a1, $a0, loop	#continue till less than given number

 	beq $a0, $s0, pryes		#Print Yes if given number = sum of its divisors

 	prno:
 		la $a0, outf		#$a0 -> address of 'outf'
 		li $v0, 4			#syscall code for printing string
 		syscall

 	b end

 	pryes:
 		la $a0, outt 		#$a0 -> address of 'outt'
 		li $v0, 4			#syscall code for printing string
 		syscall

 	end: b end

retdiv:
	#$a0 -> Dividend
	#$a1 -> Divisor
	#$v0 -> returns 1 if divisor is factor of dividend

	move $t0, $a0
	subm:
		sub $t0, $t0, $a1
		bge $t0, $a1, subm
	#Subtracting divisor from dividend till dividend>=divisor
	li $v0, 1
	beqz $t0, skip
	li $v0, 0
	#$v0 = 1 if $to==0, i.e perfectly divisible
	skip: jr $ra