.text
.globl main
# parar quando a1 == 0
#beq $a0, $zero, end
main:
    li $v0, 5  # lendo
    syscall
    
    move $a0, $v0
    beq $a0, $zero, end
    li $v0, 5  # lendo
    syscall

    move $a1, $v0  # cont

    jal ra

    move $a0, $v0 
    li $v0, 1  # imprimir
    syscall
    li $a0, 10
    li $v0, 11
    syscall
    j main
    
end:
    li, $v0, 10  
    syscall  
    
ra:
    addi $sp, $sp, -8  # salvando $ra
    sw $s0, 0($sp)  # memoria = s0 (lw é o inverso)
    sw $ra, 4($sp)  
    move $s0, $a0  # so recebe ao
    
funcao:
    div $a3, $s0, 10  # a3 = s0 / 10
    move $s0, $a3 
    mfhi $t0  
    bne $t0, $a1, cond_parada  
    addi $t1, $t1, 1 
    
cond_parada: 
    bgt $a3, 0, funcao # a3 >= 0
    mfhi $t0 # t0 = hi (resto)
    lw $s0, 0($sp)  
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    move $v0, $t1
    move $t1, $zero
    jr $ra
