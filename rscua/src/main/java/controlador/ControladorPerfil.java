package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControladorPerfil", urlPatterns = {"/ControladorPerfil"})
public class ControladorPerfil extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("perfil".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Perfil.jsp").forward(request, response);
        } else if ("configuracion".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Configuracion.jsp").forward(request, response);
        } else {
            response.sendRedirect("vista/IU_Perfil.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
