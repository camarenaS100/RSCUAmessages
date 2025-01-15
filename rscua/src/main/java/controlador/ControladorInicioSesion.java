package controlador;

import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ControladorInicioSesion")
public class ControladorInicioSesion extends HttpServlet {
    private GestorAutenticacion gestorAutenticacion = new GestorAutenticacion();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_InicioSesion.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuario = new Usuario(correo,password);
        GestorAutenticacion ga = new GestorAutenticacion();

        if(ga.IniciarSesion(usuario)){
            //Crea sesion
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            //Avisa de exito
            System.out.println("\nExito al iniciar sesion \n");
            request.setAttribute("mensaje", "Usuario inicio sesion exitosa");
            //Consigue información básica de usuario (desde controlador <- gestor -> proxyAuth -> conexion -> BdD)
            //Completa objeto sesion (desde controlador(esta clase))
            //Envia request a IU_Perfil con sesion llena y reemplaza espacio de etiquetas dinamicamente.
                //Falta modificar IU_Perfil con clase que permita URL rewriting, pendiente
            request.getRequestDispatcher("vista/IU_Perfil.jsp").forward(request, response);
        } else {
            System.out.println("\nError al iniciar sesion \n");
            request.setAttribute("mensaje", "Usuario no inicio sesion");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}
