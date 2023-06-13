# Definindo as dimensões da matriz
#define N 4
#define M 4

.data
    X:  .word  1, 2, 3, 4,
         5, 6, 7, 8,
         9, 10, 11, 12,
         13, 14, 15, 16
    result: .space 4*N*M  # Espaço para armazenar a matriz resultado
    
.text
.globl main
main:
    # Calculando a matriz transposta
    la $t0, X
    li $t1, N
    li $t2, M
    mul $t1, $t1, $t2   # Calculando o tamanho total da matriz
    sll $t1, $t1, 2     # Multiplicando por 4 para obter o deslocamento em bytes
    addi $sp, $sp, -$t1 # Alocando espaço na pilha para a matriz transposta
    
    # Calculando a transposta
    li $t3, 0
    
    outer_loop:
    beq $t3, $t1, exit_outer_loop  # Se t3 = tamanho da matriz, sair do loop externo
    li $t4, 0                     # Reinicializar o índice de coluna
    
    inner_loop:
    beq $t4, $t2, exit_inner_loop  # Se t4 = M, sair do loop interno
    
    # Calculando os endereços dos elementos na matriz original e transposta
    mul $t5, $t3, $t2    # t5 = t3 * M
    add $t6, $t5, $t4    # t6 = t5 + t4
    
    mul $t7, $t4, $t1    # t7 = t4 * tamanho da matriz
    add $t7, $t7, $t3    # t7 = t7 + t3
    
    sll $t5, $t5, 2      # t5 = t5 * 4
    sll $t7, $t7, 2      # t7 = t7 * 4
    
    add $t5, $t5, $t0    # Endereço do elemento na matriz original
    add $t7, $t7, $sp    # Endereço do elemento na matriz transposta
    
    lw $t5, 0($t5)       # Carregar o elemento da matriz original
    sw $t5, 0($t7)       # Armazenar o elemento na matriz transposta
    
    addi $t4, $t4, 1     # Incrementar o índice de coluna
    j inner_loop         # Voltar ao início do loop interno
    
    exit_inner_loop:
    addi $t3, $t3, 1     # Incrementar o índice de linha
    j outer_loop         # Voltar ao início do loop externo
    
    exit_outer_loop:
    
    # Calculando a multiplicação da matriz X com a transposta
    la $t0, X            # Carregando o endereço base da matriz original
    la $t1, result       # Carregando o endereço base da matriz resultado
    
    li $t2, N
   
