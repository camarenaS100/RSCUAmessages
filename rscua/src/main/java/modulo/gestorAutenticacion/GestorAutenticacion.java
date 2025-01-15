package modulo.gestorAutenticacion;

import servicios.ProxyAutenticacion;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestorAutenticacion {
    private ProxyAutenticacion pAutenticacion;

    public GestorAutenticacion(){
        try {
            pAutenticacion = new ProxyAutenticacion();
        }catch(SQLException e){
            System.out.println("\n\nError al usar proxy autenticacion para crear constructor\n\n");
            e.printStackTrace();
        }
    }

    public boolean Registrar(Usuario nuevoUsuario) {
        boolean exito = false;
        try {
             exito = pAutenticacion.registrar(nuevoUsuario);
        } catch (SQLException e) {
            System.out.println("\n\nError al registrar usuario\n\n");
            e.printStackTrace();
        }
        return exito;
    }

    public boolean IniciarSesion(Usuario usuario) {
        boolean exito = false;
        exito = pAutenticacion.verificarLogin(usuario.getEmail(), usuario.getPassword());
        return exito;
    }
}
