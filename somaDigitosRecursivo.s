.text
.globl main

main:
    li $v0, 5  # lendo
    syscall
    move $a0, $v0
    beq $a0, $zero, end
    
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
    add $t2, $t2, $t0
    bne $t0, $zero, cond_parada  
    
cond_parada:
    bgt $a3, 0, funcao # a3 >= 0
    lw $s0, 0($sp)  
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    move $v0, $t2
    move $t2, $zero
    jr $ra