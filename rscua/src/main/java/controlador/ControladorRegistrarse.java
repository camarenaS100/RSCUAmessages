package controlador;

import modulo.gestorRegistrarse.GestorRegistrarse;
import modulo.gestorRegistrarse.Registrarse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ControladorRegistrarse")
public class ControladorRegistrarse extends HttpServlet {
    private GestorRegistrarse gestorRegistrarse = new GestorRegistrarse();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Registrarse nuevoRegistro = new Registrarse(id,nombre,username,phone,email,password);
        boolean UsuarioRegistrado = gestorRegistrarse.UsuarioRegistrado(nuevoRegistro);

        if(UsuarioRegistrado){
            request.setAttribute("mensaje", "Usuario registrado");
            request.getRequestDispatcher("/WEB-INF/jsp/registrarse.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Usuario no registrado");
            request.getRequestDispatcher("/WEB-INF/jsp/registrarse.jsp").forward(request, response);
        }
    }
}
