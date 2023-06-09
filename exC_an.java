import java.util.Scanner;

public class exC_an {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int i, j;
        int m = 2, n = 2;
        int a[][] = new int[m][n];
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                System.out.print("Digite num:");
                a[i][j] = in.nextInt();
                // a[i][j] = i + j;
            }
        }
        System.out.println();
        System.out.println("Original");
        imprime(m, n, a);
        mulMatrizPelaTrasposta(m, n, a);

        System.out.println("Identidade:");
        System.out.println(ehIdentidade(m, n, a));

    }

    public static int[][] mulMatrizPelaTrasposta(int m, int n, int a[][]) {

        int i, j, k;
        int b[][] = new int[n][m];
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                b[j][i] = a[i][j];
            }
        }
        System.out.println("Transposta");
        imprime(n, m, b);

        int c[][] = new int[m][m];

        for (i = 0; i < m; i++)
            for (j = 0; j < m; j++)
                for (k = 0; k < n; k++)
                    c[i][j] += a[i][k] * b[k][j];

        System.out.println("Mult");
        imprime(m, m, c);
        return c;
    }

    static void imprime(int m, int n, int x[][]) {
        int i, j;
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                System.out.print(x[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static boolean ehIdentidade(int m, int n, int x[][]) {
        if (m != n)
            return false;

        int i, j;
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                if (i == j) {
                    if (x[i][j] != 1)
                        return false;
                } else {
                    if (x[i][j] != 0)
                        return false;

                }
            }
        }
        return true;
    }
}
