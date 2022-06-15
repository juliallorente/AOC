.text
.globl main

main:
	li $v0, 5
	syscall
	move $s1, $v0
	li $s0, 1
while:
	mul $s0, $s0, $s1
	sub $s1, $s1, 1  # $s1 = $s2 - 1
	bnez $s1, while   # se s1 != 0 va para while
	
	li $v0, 1
	move $a0, $s0
	syscall 
end:
	li $v0, 10
	syscall
