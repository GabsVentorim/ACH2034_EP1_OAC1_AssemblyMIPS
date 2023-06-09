public class exB_an {

    public static void main(String[] args) {
        // colocar exemplo de uso
    }

    /**
     * Método que retorna o produto escalar de dois vetores
     * 
     * @param tam  tamanho dos dois vetores
     * @param v1[] vetor 1
     * @param v2[] vetor 2
     */
    public int prodEscalar(int tam, int v1[], int v2[]) {
        int resp = 0;
        for (int i = 0; i < tam; i++) {
            resp += v1[i] * v2[i];
        }
        return resp;
    }
}
