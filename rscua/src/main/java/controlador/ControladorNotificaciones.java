package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorNotificaciones", urlPatterns = {"/ControladorNotificaciones"})
public class ControladorNotificaciones extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("configuracion".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Configuracion.jsp").forward(request, response);
        } else if ("busqueda".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Busqueda.jsp").forward(request, response);
        } else if ("notificaciones".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Notificaciones.jsp").forward(request, response);
        } else {
            // Acción por defecto
            response.sendRedirect("vista/IU_Notificaciones.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
