package servicios;

import modulo.gestorPublicaciones.Publicaciones;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProxyPublicaciones {
    private Conexion conexion;

    public ProxyPublicaciones() throws SQLException {
        this.conexion = new Conexion();
    }

    public boolean crearPublicacion(Publicaciones publicacion) throws SQLException {
        String callSP = "{CALL sp_crear_publicacion(?, ?, ?, ?, ?, ?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setInt(1, publicacion.getUsuarioId());
            cs.setString(2, publicacion.getContenido());
            cs.setString(3, publicacion.getTipoContenido().name().toLowerCase());
            cs.setTimestamp(4, publicacion.getFechaPublicacion());
            cs.setString(5, publicacion.getEtiquetas());
            cs.setString(6, publicacion.getPrivacidad().name().toLowerCase());
            return cs.executeUpdate() > 0;
        }
    }

    public boolean eliminarPublicacion(int idPublicacion) throws SQLException {
        String callSP = "{CALL sp_eliminar_publicacion(?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setInt(1, idPublicacion);
            return cs.executeUpdate() > 0;
        }
    }

    public List<Publicaciones> obtenerPublicacionesPorUsuario(int usuarioId) throws SQLException {
        String query = "SELECT * FROM publicaciones WHERE usuario_id = ?";
        List<Publicaciones> publicaciones = new ArrayList<>();
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setInt(1, usuarioId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Publicaciones publicacion = new Publicaciones();
                    publicacion.setId(rs.getInt("id"));
                    publicacion.setUsuarioId(rs.getInt("usuario_id"));
                    publicacion.setContenido(rs.getString("contenido"));
                    publicacion.setTipoContenido(
                            Publicaciones.TipoContenido.valueOf(rs.getString("tipo_contenido").toUpperCase())
                    );
                    publicacion.setFechaPublicacion(rs.getTimestamp("fecha_publicacion"));
                    publicacion.setEtiquetas(rs.getString("etiquetas"));
                    publicacion.setPrivacidad(
                            Publicaciones.Privacidad.valueOf(rs.getString("privacidad").toUpperCase())
                    );
                    publicaciones.add(publicacion);
                }
            }
        }
        return publicaciones;
    }


    public boolean editarPublicacion(Publicaciones publicacion) throws SQLException {
        String callSP = "{CALL sp_editar_publicacion(?, ?, ?, ?, ?, ?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setInt(1, publicacion.getId());
            cs.setString(2, publicacion.getContenido());
            cs.setString(3, publicacion.getTipoContenido().name().toLowerCase());
            cs.setString(4, publicacion.getEtiquetas());
            cs.setString(5, publicacion.getPrivacidad().name());
            cs.setString(6, publicacion.getPrivacidad().name().toLowerCase());
            return cs.executeUpdate() > 0;
        }
    }
}
