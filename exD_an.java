public class exD_an {
    public boolean ehIdentidade(int m, int n, int x[][]) {
        int i, j;
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                if (i == j) {
                    if (x[i][j] != 1)
                        return false;
                } else 
                if (x[i][j] != 0) {
                    return false;
                }
            }
        }
        return true;
    }
}
