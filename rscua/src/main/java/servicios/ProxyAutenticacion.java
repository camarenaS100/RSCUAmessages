package servicios;

import modulo.gestorAutenticacion.Usuario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ProxyAutenticacion {
    private Conexion conexion;

    public ProxyAutenticacion() throws SQLException {
        this.conexion = new Conexion();
    }

    public boolean existeCorreoTelefonoOUsername(String email, String phone, String username) throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM usuario WHERE correo = ? OR numTelefono = ? OR nombreUsuario = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, phone);
            ps.setString(3, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("count") > 0;
                }
            }
        }
        return false;
    }


    public boolean registrar(Usuario nU) throws SQLException {
        if (existeCorreoTelefonoOUsername(nU.getEmail(), nU.getPhone(), nU.getUsername())) {
            System.out.println("Email, phone number, or username already exists. Registration aborted.");
            return false;
        }

        String query = "INSERT INTO usuario (correo, numTelefono, nombreUsuario, nombrePersonal, apellido, contrasenia, fechaNacimiento, sexo) VALUES (?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, nU.getEmail());
            ps.setString(2, nU.getPhone());
            ps.setString(3, nU.getUsername());
            ps.setString(4, nU.getNombre());
            ps.setString(5, nU.getApellido());
            ps.setString(6, nU.getPassword());
            ps.setDate(7, nU.getFecnac());  // fecnac es java.sql.Date
            String sexo = ((Usuario.Sexo) nU.getSexo()).name();
            ps.setString(8, sexo);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }


    public boolean verificarLogin(String correo, String password) {
        String query = "SELECT * FROM usuario WHERE correo = ? AND contrasenia = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, correo);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            } catch (SQLException rsEx) {
                System.err.println("Error de Query: " + rsEx.getMessage());
                rsEx.printStackTrace();
                return false;
            }
        } catch (SQLException psEx) {
            System.err.println("Error Prepared Statement o Conexion: " + psEx.getMessage());
            psEx.printStackTrace();
            return false;
        }
    }

}
