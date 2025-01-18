package modulo.gestorPublicaciones;

import servicios.ProxyPublicaciones;

import java.sql.SQLException;
import java.util.List;

public class GestorPublicaciones {
    private ProxyPublicaciones proxyPublicaciones;

    public GestorPublicaciones() {
        try {
            proxyPublicaciones = new ProxyPublicaciones();
        } catch (SQLException e) {
            System.out.println("Error al inicializar ProxyPublicaciones");
            e.printStackTrace();
        }
    }

    public boolean crearPublicacion(Publicaciones nuevaPublicacion) {
        try {
            return proxyPublicaciones.crearPublicacion(nuevaPublicacion);
        } catch (SQLException e) {
            System.out.println("Error al crear publicación");
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarPublicacion(int idPublicacion) {
        try {
            return proxyPublicaciones.eliminarPublicacion(idPublicacion);
        } catch (SQLException e) {
            System.out.println("Error al eliminar publicación");
            e.printStackTrace();
            return false;
        }
    }

    public List<Publicaciones> obtenerPublicacionesPorUsuario(int usuarioId) {
        try {
            return proxyPublicaciones.obtenerPublicacionesPorUsuario(usuarioId);
        } catch (SQLException e) {
            System.out.println("Error al obtener publicaciones");
            e.printStackTrace();
            return null;
        }
    }

    public boolean editarPublicacion(Publicaciones publicacionEditada) {
        try {
            return proxyPublicaciones.editarPublicacion(publicacionEditada);
        } catch (SQLException e) {
            System.out.println("Error al editar publicación");
            e.printStackTrace();
            return false;
        }
    }
}
