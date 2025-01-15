package controlador;

import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/ControladorRegistrarse")
public class ControladorRegistrarse extends HttpServlet {
    private GestorAutenticacion gestorAutenticacion = new GestorAutenticacion();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("name");
        String apellido = request.getParameter("lastname");
        String fn = request.getParameter("fn");   // HTML5 hace "yyyy-MM-dd"
        String sexo = request.getParameter("sex");
        String username = request.getParameter("username");
        String telefono = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Date fecnac;
        try {
            fecnac = Date.valueOf(fn);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Fecha de nacimiento inválida.");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
            return;
        }

        Usuario nuevoUsuario = new Usuario(nombre,apellido,username,telefono,email,password,fecnac,sexo);
        GestorAutenticacion ga = new GestorAutenticacion();

        if(ga.Registrar(nuevoUsuario)){
            System.out.println("Exito al registrar usuario : "+ username);
            request.setAttribute("mensaje", "Usuario registrado");
            request.getRequestDispatcher("vista/IU_InicioSesion.jsp").forward(request, response);
        } else {
            System.out.println("Error al registrar usuario, checar unicidad de credenciales");
            request.setAttribute("mensaje", "Usuario no registrado");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}
