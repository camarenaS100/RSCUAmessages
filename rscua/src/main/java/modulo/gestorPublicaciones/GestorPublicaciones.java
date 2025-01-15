package modulo.gestorPublicaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GestorPublicaciones {
    private List<Publicaciones> publicaciones;

    public GestorPublicaciones() {
        this.publicaciones = new ArrayList<>();
    }

    // Crear publicación
    public void crearPublicacion(String usuario, String contenido, String imagen) {
        String id = generarId();
        Publicaciones nuevaPublicacion = new Publicaciones(id, usuario, contenido, imagen, new Date());
        publicaciones.add(nuevaPublicacion);
        //sql
    }

    // Editar publicación
    public boolean editarPublicacion(String id, String nuevoContenido, String nuevaImagen) {
        for (Publicaciones pub : publicaciones) {
            if (pub.getId().equals(id)) {
                pub.setContenido(nuevoContenido);
                if (nuevaImagen != null) {
                    pub.setImagen(nuevaImagen);
                }
                return true; // Edición exitosa
            }
        }
        return false; // No se encontró la publicación
        //sql
    }

    // Eliminar publicación
    public boolean eliminarPublicacion(String id) {
        //return publicaciones.removeIf(pub -> pub.getId().equals(id));
        return true; //sql
    }

    // Obtener publicaciones de un usuario
    public List<Publicaciones> obtenerPublicacionesPorUsuario(String usuario) {
        List<Publicaciones> resultado = new ArrayList<>();
        for (Publicaciones pub : publicaciones) {
            if (pub.getUsuario().equals(usuario)) {
                resultado.add(pub);
            }
        }
        return resultado; //sql
    }

    // Interacción con publicaciones
    public boolean reaccionarPublicacion(String id) {
        return true; //sql
    }

    public boolean agregarComentario(String id) {
        return true; //sql
    }

    public boolean compartirPublicacion(String id) {
      return true; //sql
    }

    private String generarId() {
        return ""; //sql
    }

    public List<Publicaciones> getPublicaciones() {
        return publicaciones;
    }
}
