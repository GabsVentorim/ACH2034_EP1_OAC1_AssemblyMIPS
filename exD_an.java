public class exD_an {

    public static void main(String[] args) {
        // colocar exemplo de uso
    }

    /**
     * Método que retorna um boolean se uma matriz dada é identidade(true) ou não
     * (false)
     * 
     * @param m     tamanho das linhas da matriz
     * @param n     tamanho das linhas da matriz
     * @param x[][] matriz
     */
    public boolean ehIdentidade(int m, int n, int x[][]) {
        int i, j;
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                if (i == j) {
                    if (x[i][j] != 1)
                        return false;
                } else if (x[i][j] != 0) {
                    return false;
                }
            }
        }
        return true;
    }
}
