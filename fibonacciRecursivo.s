.text
.globl main

main:

    li $v0, 5
    syscall  # lendo
    add $v0, $v0, 1
    add $a0, $v0, $zero

    jal fibonacci # chamando func

    add $a0, $v0, $zero
    li $v0, 1
    syscall

    li $v0, 10
    syscall

fibonacci:

    addi $sp, $sp, -12 # salvando na pilha
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    add $s0, $a0, $zero
    addi $t1, $zero, 1
    beq $s0, $zero, return_0
    beq $s0, $t1, return_1
    addi $a0, $s0, -1

    jal fibonacci

    add $s1, $zero, $v0   
    addi $a0, $s0, -2

    jal fibonacci    

    add $v0, $v0, $s1  # v0 = fib(n-2)+ $s1

exitfib:
    lw $ra, 0($sp)  # registrando na pilha
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12      
    jr $ra

#return( fib(x-1)+fib(x-2) );
return_1:
    li $v0, 1
    j exitfib
 
return_0 :     
    li $v0, 0
    j exitfib
