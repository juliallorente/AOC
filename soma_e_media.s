.data
	msg: .asciiz "ERRO"

.text

main: 
	li $v0, 5  # lendo v0
	syscall
	move $s1, $v0  # movendo para s1 valor de v0
	
	li $s0, -1  # s0 recebe -1
	bne $s0, $s1, soma  # se t0 != s0 
	
	beq $s0, $s1, print
	

print:
	li $v0, 1
	move $a0, $s2
	syscall
	
	# formatando a saida
	li $a0, 10  	
	li $v0, 11  
	syscall     
	beq $s1, -1, erro
	
media:
	div $s2, $s3  # s2/s3
	mflo $s0  # s0 = media
	move $a0, $s0
	li $v0, 1
	syscall
	
	
	beq $s1, -1, end
	

soma:	
	add $s2, $s1, $s2  # s2 acumula soma
	add $s3, $s3, 1  # s3 cont
	bne $s3, $s0, main
	
	#imprimir mensagen de erro

erro:
	bnez $s3, media  # confere erro
	li $v0, 4
	la $a0, msg
	syscall	

	
end:
	li $v0, 10
	syscall
