public class exA_an {

    // public static void main(String[] args) { }

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
