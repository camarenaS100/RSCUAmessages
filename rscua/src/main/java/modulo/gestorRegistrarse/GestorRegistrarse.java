package modulo.gestorRegistrarse;

import java.util.ArrayList;
import java.util.List;

public class GestorRegistrarse {
    private static List<Registrarse> registrarse = new ArrayList<>();

    public boolean UsuarioRegistrado(Registrarse registrarUsuario) {

        for (Registrarse r: registrarse) {
            if(r.getUsername().equals(registrarUsuario.getUsername())) {
                return false;
            }
        }
        registrarse.add(registrarUsuario);
        return true;
    }

    public List<Registrarse> getRegistrarse() {
        return registrarse;
    }
}
