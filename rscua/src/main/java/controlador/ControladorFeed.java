package controlador;

import modulo.gestorPublicaciones.GestorPublicaciones;
import modulo.gestorPublicaciones.Publicaciones;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ControladorFeed")
public class ControladorFeed extends HttpServlet {

    private GestorPublicaciones gestorPublicaciones;

    @Override
    public void init() throws ServletException {
        gestorPublicaciones = new GestorPublicaciones();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        // Validar la acción solicitada
        if ("feed".equals(accion)) {
            cargarPublicaciones(request, response); // Llamar al método que prepara las publicaciones
        } else {
            response.sendRedirect("vista/IU_Feed.jsp"); // Redirigir si la acción no es "feed"
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirigir al método para cargar publicaciones
        cargarPublicaciones(request, response);
    }

    /**
     * Método para cargar las publicaciones y redirigir al JSP
     */
    private void cargarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener las publicaciones del usuario con ID = 1 (puedes personalizar esto)
            List<Publicaciones> publicaciones = gestorPublicaciones.obtenerPublicacionesPorUsuario(1);

            // Pasar las publicaciones al JSP como atributo
            request.setAttribute("publicaciones", publicaciones);

            // Redirigir al JSP del feed
            request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vista/IU_Error.jsp"); // Redirigir a una página de error en caso de fallo
        }
    }
}
