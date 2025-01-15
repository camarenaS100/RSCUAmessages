package controlador;

import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            String username = request.getParameter("username");
            System.out.println("Exito al iniciar sesion "+ username);
            request.setAttribute("mensaje", "Usuario ");
            //Falta crear sesion aqui
            request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
        } else {
            System.out.println("Error al iniciar sesion");
            request.setAttribute("mensaje", "Usuario no registrado");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}
