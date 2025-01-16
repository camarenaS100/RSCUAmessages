package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControladorAyuda", urlPatterns = {"/ControladorAyuda"})
public class ControladorAsistencia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_Ayuda.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            response.sendRedirect("ControladorAyuda");
        } else {
            switch (accion) {
                case "preguntas":
                    // Después
                    break;
                case "reportes":
                    //Después
                    break;
                case "chat":
                    //
                    break;
                case "acerca":
                    request.getRequestDispatcher("vista/IU_AcercaDe.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect("ControladorAyuda");
                    break;
            }
        }
    }
}
