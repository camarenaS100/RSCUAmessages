package controlador;

import modulo.gestorAutenticacion.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ControladorCerrarSesion")
public class ControladorCerrarSesion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalida la sesión actual
        request.getSession().invalidate();
        // Redirige a la página de inicio de sesión
        response.sendRedirect(request.getContextPath() + "/vista/IU_InicioSesion.jsp");
    }
}
