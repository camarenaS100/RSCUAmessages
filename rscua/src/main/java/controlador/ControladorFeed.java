package controlador;

import modulo.gestorRegistrarse.Registrarse;
import modulo.gestorRegistrarse.GestorRegistrarse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ControladorFeed")
public class ControladorFeed extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mensaje", "Log");
        request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
    }

}
