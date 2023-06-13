# Definindo as dimensões da matriz
#define M 4
#define N 3

.data
    matrix: .word 1, 2, 3,
            4, 5, 6,
            7, 8, 9,
            10, 11, 12
    ##transpose: .space 4*M_TRANSPOSE*N_TRANSPOSE  # Espaço para armazenar a matriz transposta

.text
.globl main
main:
    # Carregando o endereço base da matriz original
    la $t0, matrix

    # Chamando a função para calcular a transposta
    jal transpose_matrix

    # Fim do programa
    li $v0, 10           # Código de saída do programa
    syscall

# Função para calcular a transposta da matriz
transpose_matrix:
    # Salvando o endereço de retorno na pilha
    sw $ra, 0($sp)
    addiu $sp, $sp, -4

    # Salvando os registradores usados na pilha
    sw $s0, 0($sp)
    addiu $sp, $sp, -4
    sw $s1, 0($sp)
    addiu $sp, $sp, -4

    # Copiando os parâmetros para os registradores
    move $s0, $a0    # Endereço da matriz original
    move $s1, $a1    # Endereço da matriz transposta

    # Percorrendo a matriz original
    li $t0, 0            # Índice da linha atual

outer_loop:
    beq $t0, $a0, exit_outer_loop  # Se t0 = M, sair do loop externo

    li $t1, 0            # Índice da coluna atual

inner_loop:
    beq $t1, $a1, exit_inner_loop  # Se t1 = N, sair do loop interno

    # Calculando os endereços dos elementos na matriz original e transposta
    mul $t2, $t0, $a1    # t2 = t0 * N
    add $t2, $t2, $t1    # t2 = t2 + t1

    mul $t3, $t1, $a0    # t3 = t1 * M
    add $t3, $t3, $t0    # t3 = t3 + t0

    sll $t2, $t2, 2      # t2 = t2 * 4 (deslocamento em bytes)
    sll $t3, $t3, 2      # t3 = t3 * 4 (deslocamento em bytes)

    add $t2, $t2, $s0    # Endereço do elemento na matriz original
    add $t3, $t3, $s1    # Endereço do elemento na matriz transposta

    lw $t2, 0($t2)       # Carregar o elemento da matriz original
    sw $t2, 0($t3)       # Armazenar o elemento na matriz transposta

    addi $t1, $t1, 1     # Incrementar o índice da coluna
    j inner_loop         # Voltar ao início do loop interno

exit_inner_loop:
    addi $t0, $t0, 1     # Incrementar o índice da linha
    j outer_loop         # Voltar ao início do loop externo

exit_outer_loop:
    # Restaurando os registradores da pilha
    lw $s1, 0($sp)
    addiu $sp, $sp, 4
    lw $s0, 0($sp)
    addiu $sp, $sp, 4

    # Restaurando o endereço de retorno da pilha
    lw $ra, 0($sp)
    addiu $sp, $sp, 4

    # Retornando da função
    jr $ra
