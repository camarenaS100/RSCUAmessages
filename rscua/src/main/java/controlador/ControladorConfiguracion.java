package controlador;

import modulo.gestorConfiguracion.GestorConfiguracion;
import modulo.gestorConfiguracion.Configuracion;
import servicios.ProxyConfiguracion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ControladorConfiguracion")
public class ControladorConfiguracion extends HttpServlet {
    private GestorConfiguracion gestorConfiguracion;
    private ProxyConfiguracion proxyConfiguracion; // Para persistir cambios en BD

    @Override
    public void init() throws ServletException {
        gestorConfiguracion = new GestorConfiguracion();
        try {
            proxyConfiguracion = new ProxyConfiguracion();
        } catch(SQLException e) {
            throw new ServletException("Error al inicializar ProxyConfiguracion", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession();

        modulo.gestorAutenticacion.Usuario usuario = (modulo.gestorAutenticacion.Usuario) session.getAttribute("usuario");
        int id_usuario = usuario.getId();

        Configuracion configSession = (Configuracion) session.getAttribute("configuracion");
        if (configSession == null) {
            configSession = gestorConfiguracion.getConfiguracion(id_usuario);
            session.setAttribute("configuracion", configSession);
        }

        try {
            if ("mostrarPanelTema".equals(accion)) {
                gestorConfiguracion.mostrarPanelTema(true);
                gestorConfiguracion.mostrarPanelIdioma(false);
            } else if ("temaOscuro".equals(accion)) {
                gestorConfiguracion.cambiarTemaOscuro(id_usuario);
                gestorConfiguracion.mostrarPanelTema(false);
                proxyConfiguracion.cambiarTema(id_usuario, Configuracion.Tema.OSCURO);
            } else if ("temaClaro".equals(accion)) {
                gestorConfiguracion.cambiarTemaClaro(id_usuario);
                gestorConfiguracion.mostrarPanelTema(false);
                proxyConfiguracion.cambiarTema(id_usuario, Configuracion.Tema.CLARO);
            } else if ("mostrarPanelIdioma".equals(accion)) {
                gestorConfiguracion.mostrarPanelIdioma(true);
                gestorConfiguracion.mostrarPanelTema(false);
            } else if ("cambiarIdioma".equals(accion)) {
                // Se espera un parámetro "idioma" (por ejemplo, "ES", "EN" o "FR")
                String idiomaStr = request.getParameter("idioma");
                gestorConfiguracion.cambiarIdioma(id_usuario, idiomaStr.toUpperCase());
                proxyConfiguracion.cambiarIdioma(id_usuario, idiomaStr.toUpperCase());
            } else if ("cambiarPrivacidad".equals(accion)) {
                String privacidadStr = request.getParameter("privacidad");
                Configuracion.Privacidad nuevaPrivacidad = Configuracion.Privacidad.valueOf(privacidadStr.toUpperCase());
                gestorConfiguracion.cambiarPrivacidad(id_usuario, nuevaPrivacidad);
                proxyConfiguracion.cambiarPrivacidad(id_usuario, nuevaPrivacidad);
            }
        } catch(SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar configuración");
        }

        // Actualiza la configuración en la sesión para que la IU se refresque
        try {
            configSession = proxyConfiguracion.obtenerConfiguracion(id_usuario);
        } catch(SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("configuracion", configSession);
        request.setAttribute("configuracion", configSession);
        session.setAttribute("esOscuro", configSession.getTema() == Configuracion.Tema.OSCURO);
        request.setAttribute("mostrarPanelTema", gestorConfiguracion.isMostrarPanelTema());
        request.setAttribute("mostrarPanelIdioma", gestorConfiguracion.isMostrarPanelIdioma());

        request.getRequestDispatcher("/vista/IU_Configuracion.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
