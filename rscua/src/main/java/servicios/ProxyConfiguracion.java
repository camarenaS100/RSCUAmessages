package servicios;

import modulo.gestorConfiguracion.Configuracion;
import modulo.gestorConfiguracion.Configuracion.Privacidad;
import modulo.gestorConfiguracion.Configuracion.Tema;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProxyConfiguracion {
    private Conexion conexion;

    public ProxyConfiguracion() throws SQLException {
        this.conexion = new Conexion();
    }

    /**
     * Actualiza el tema (OSCURO o CLARO) para el usuario con el id indicado.
     */
    public boolean cambiarTema(int usuarioId, Tema nuevoTema) throws SQLException {
        String query = "UPDATE configuracion SET tema = ? WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, nuevoTema.name());
            ps.setInt(2, usuarioId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Actualiza el idioma para el usuario con el id indicado.
     * Ahora idioma es String, por lo tanto se trabaja directamente con la cadena.
     */
    public boolean cambiarIdioma(int usuarioId, String nuevoIdioma) throws SQLException {
        String query = "UPDATE configuracion SET idioma = ? WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, nuevoIdioma);
            ps.setInt(2, usuarioId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Actualiza la privacidad para el usuario con el id indicado.
     */
    public boolean cambiarPrivacidad(int usuarioId, Privacidad nuevaPrivacidad) throws SQLException {
        String query = "UPDATE configuracion SET privacidad = ? WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, nuevaPrivacidad.name());
            ps.setInt(2, usuarioId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Recupera la configuración actual para el usuario con el id indicado.
     */
    public Configuracion obtenerConfiguracion(int usuarioId) throws SQLException {
        Configuracion config = null;
        String query = "SELECT * FROM configuracion WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setInt(1, usuarioId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Ahora el idioma se obtiene directamente como String.
                    String idiomaStr = rs.getString("idioma");
                    String privacidadStr = rs.getString("privacidad");
                    String temaStr = rs.getString("tema");

                    // Se construye la configuración usando el valor de idioma como String.
                    config = new Configuracion(usuarioId, idiomaStr,
                            Privacidad.valueOf(privacidadStr.toUpperCase()),
                            Tema.valueOf(temaStr.toUpperCase()));
                }
            }
        }
        return config;
    }
}
