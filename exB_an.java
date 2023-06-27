public class exB_an {

    public static int n = 4;

    public static void main(String[] args) {
        // colocar exemplo de uso
        int A[] = { 1, 2, 3, 4 };
        int B[] = { 5, 6, 7, 8 };
        System.out.println(produtoEscalar(n, A, B));
    }

    /**
     * Método que retorna o produto escalar de dois vetores
     * 
     * @param tam  tamanho dos dois vetores
     * @param v1[] vetor 1
     * @param v2[] vetor 2
     */
    public static int produtoEscalar(int tam, int v1[], int v2[]) {
        int resp = 0;
        for (int i = 0; i < tam; i++) {
            resp += v1[i] * v2[i];
        }
        System.out.println(resp);
        return resp;
    }
}
