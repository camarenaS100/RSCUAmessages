package controlador;

import modulo.gestorConfiguracion.GestorConfiguracion;
import modulo.gestorConfiguracion.Configuracion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ControladorConfiguracion")
public class ControladorConfiguracion extends HttpServlet {
    private GestorConfiguracion gestorConfiguracion;

    @Override
    public void init() throws ServletException {
        gestorConfiguracion = new GestorConfiguracion();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String idioma = request.getParameter("idioma");

        if ("mostrarPanelTema".equals(accion)) {
            gestorConfiguracion.mostrarPanelTema(true);
            gestorConfiguracion.mostrarPanelIdioma(false);

        } else if ("temaOscuro".equals(accion)) {
            gestorConfiguracion.cambiarTemaOscuro();
            gestorConfiguracion.mostrarPanelTema(false);

        } else if ("temaClaro".equals(accion)) {
            gestorConfiguracion.cambiarTemaClaro();
            gestorConfiguracion.mostrarPanelTema(false);

        } else if ("mostrarPanelIdioma".equals(accion)) {
            gestorConfiguracion.mostrarPanelIdioma(true);
            gestorConfiguracion.mostrarPanelTema(false);

        } else if("buscar".equals(accion)) {
            // Obtener la consulta de búsqueda
            String query = request.getParameter("query");

            // Redirigir al JSP de búsqueda
            request.setAttribute("query", query); // Pasar la consulta al JSP si es necesario
            request.getRequestDispatcher("vista/IU_Busqueda.jsp").forward(request, response);
        }

        request.setAttribute("configuracion", gestorConfiguracion.getConfiguracion());
        request.setAttribute("esOscuro",
                gestorConfiguracion.getConfiguracion().getTema() == Configuracion.Tema.OSCURO);
        request.setAttribute("mostrarPanelTema", gestorConfiguracion.isMostrarPanelTema());
        request.setAttribute("mostrarPanelIdioma", gestorConfiguracion.isMostrarPanelIdioma());

        request.getRequestDispatcher("/vista/IU_Configuracion.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("configuracion", gestorConfiguracion.getConfiguracion());
        request.setAttribute("esOscuro",
                gestorConfiguracion.getConfiguracion().getTema() == Configuracion.Tema.OSCURO);
        request.setAttribute("mostrarPanelTema", gestorConfiguracion.isMostrarPanelTema());
        request.setAttribute("mostrarPanelIdioma", gestorConfiguracion.isMostrarPanelIdioma());

        request.getRequestDispatcher("/vista/IU_Configuracion.jsp").forward(request, response);
    }
}


//            gestorConfiguracion.getConfiguracion().setTema(Configuracion.Tema.CLARO);
