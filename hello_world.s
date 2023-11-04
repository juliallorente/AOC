.data
hello:      .asciiz     "Hello, World!\n"

.text
main:
    li       $v0, 4              # código para syscall "print string"
    la       $a0, hello          # carrega o endereço da string hello
    syscall                     # executa o syscall
    li       $v0, 10             # código para syscall "exit"
    syscall                     # termina o programa

