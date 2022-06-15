.text

main:
	li $v0, 5
	syscall
	move $s1, $v0 
	li $s3, 0
	li $s4, 1
	li $s6, 0
	
		
fib:	
	add $s5, $s3, $s4
	move $s3, $s4
	move $s4, $s5
	add $s6, $s6, 1 # indice ++
	bne $s1, $s6, fib  
	beq $s1, $s6, func


func:
	li $v0, 1
	move $a0, $s5
	syscall 
	j end


end:
	li $v0, 10
	syscall
