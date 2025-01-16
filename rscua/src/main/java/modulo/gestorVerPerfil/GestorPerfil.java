package modulo.gestorVerPerfil;

import java.util.ArrayList;
import java.util.List;

public class GestorPerfil {
    private Perfil perfil;

    public GestorPerfil() {
        this.perfil = new Perfil();
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public String visualizarPerfil() {
        return "Nombre: " + perfil.getNombre() + "\n" +
                "Username: " + perfil.getUsername() + "\n" +
                "Descripción: " + perfil.getDescripcion();
    }

    public String visualizarDescripcion() {
        return "Descripción: " + perfil.getDescripcion();
    }

    //Visualizar publicaciones
    public List<String> visualizarPublicaciones() {
        return perfil.getPublicaciones();
    }

    //Visualizar seguidores y seguidos
    public List<String> visualizarSeguidores() {
        return perfil.getSeguidores();
    }

    public List<String> visualizarSeguidos() {
        return perfil.getSeguidos();
    }

    //Filtrar publicaciones por año test
    public List<String> filtrarPublicacionesPorAnio(int anio) {
        // Simulación: Este método debería implementar lógica para filtrar por año real
        List<String> filtradas = new ArrayList<>();
        for (String publicacion : perfil.getPublicaciones()) {
            if (publicacion.contains(String.valueOf(anio))) { // Ejemplo simplista
                filtradas.add(publicacion);
            }
        }
        return filtradas;
    }

    public void agregarPublicacion(String publicacion) {
        perfil.agregarPublicacion(publicacion); //sql
    }

    public void eliminarPublicacion(String publicacion) {
        perfil.eliminarPublicacion(publicacion); //sql
    }

    public void agregarSeguidor(String seguidor) {
        perfil.agregarSeguidor(seguidor); //sql
    }

    public void eliminarSeguidor(String seguidor) {
        perfil.eliminarSeguidor(seguidor); //sql
    }

    public void agregarSeguido(String seguido) {
        perfil.agregarSeguido(seguido); //sql
    }

    public void eliminarSeguido(String seguido) {
        perfil.eliminarSeguido(seguido); //sql
    }
}
