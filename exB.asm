#define N 4

.data
    A: .word 1, 2, 3, 4
    B: .word 5, 6, 7, 8
    resultado: .word 0   # Variável para armazenar o resultado
    
.text
.globl main
main:
    la $t0, A            # Carregando o endereço base do vetor A
    la $t1, B            # Carregando o endereço base do vetor B
    
    li $t2, N            # Definindo o tamanho dos vetores
    
    li $t3, 0            # Variável para armazenar o resultado parcial
    
    loop:
    beq $t2, $zero, exit_loop  # Se t2 == 0, sair do loop
    
    lw $t4, 0($t0)       # Carregar o elemento do vetor A
    lw $t5, 0($t1)       # Carregar o elemento do vetor B
    
    mul $t6, $t4, $t5    # Multiplicar os elementos
    
    add $t3, $t3, $t6    # Somar o resultado parcial
    
    addi $t0, $t0, 4     # Avançar para o próximo elemento em A
    addi $t1, $t1, 4     # Avançar para o próximo elemento em B
    
    addi $t2, $t2, -1    # Decrementar o contador
    
    j loop               # Voltar ao início do loop
    
    exit_loop:
    la $t2, resultado    # Carregando o endereço da variável resultado
    sw $t3, 0($t2)       # Armazenando o resultado
    
    # Fim do programa
    li $v0, 10           # Código de saída do programa
    syscall
