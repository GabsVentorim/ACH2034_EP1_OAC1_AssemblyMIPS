public class exA_an {

    public static void main(String[] args) {
        // colocar exemplo de uso
    }

    /**
     * Método que retorna a traspota de uma matriz
     * 
     * @param m     tamanho das linhas da matriz original
     * @param n     tamanho das colunas da matriz original
     * @param a[][] matriz original
     */
    public int[][] transposta(int m, int n, int a[][]) {
        int i, j;
        int b[][] = new int[n][m];
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                b[j][i] = a[i][j];
            }
        }
        return b;
    }
}
