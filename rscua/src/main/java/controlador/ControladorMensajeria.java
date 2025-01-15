package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControladorMensajeria", urlPatterns = {"/ControladorMensajeria"})
public class ControladorMensajeria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("chats".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Mensajeria.jsp").forward(request, response);
        } else {
            response.sendRedirect("vista/IU_Busqueda.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}