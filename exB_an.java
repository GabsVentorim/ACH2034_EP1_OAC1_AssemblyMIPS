public class exB_an {
    public int prodEscalar(int tam, int v1, int v2) {
        int resp = 0;
        for (int i = 0; i < tam; i++) {
            resp += v1 * v2;
        }
        return resp;
    }
}
