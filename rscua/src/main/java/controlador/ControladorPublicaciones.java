package controlador;

import modulo.gestorPublicaciones.GestorPublicaciones;
import modulo.gestorPublicaciones.Publicaciones;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/ControladorPublicaciones")
public class ControladorPublicaciones extends HttpServlet {
    private GestorPublicaciones gestorPublicaciones;

    @Override
    public void init() throws ServletException {
        gestorPublicaciones = new GestorPublicaciones();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Crear la publicación
        Publicaciones nuevaPublicacion = new Publicaciones();

        //Obtener datos del formulario
        String contenido     = request.getParameter("contenido");
        String tipoContenido = request.getParameter("tipoContenido"); // "texto", "imagen", "video"
        String etiquetas     = request.getParameter("etiquetas");
        String privacidad    = request.getParameter("privacidad");    // "publico", "amigos", "privado"

        //Asignar contenido
        nuevaPublicacion.setContenido(contenido);

        //Manejar tipoContenido => enum en Java: TEXTO, IMAGEN, VIDEO
        //Se convierte a mayúsculas antes de valueOf(...)
        if (tipoContenido != null) {
            tipoContenido = tipoContenido.toUpperCase(); // "texto" -> "TEXTO"
            nuevaPublicacion.setTipoContenido(
                    Publicaciones.TipoContenido.valueOf(tipoContenido)
            );
        } else {
            nuevaPublicacion.setTipoContenido(Publicaciones.TipoContenido.TEXTO);
        }

        //Manejar privacidad => PUBLICO, AMIGOS, PRIVADO
        if (privacidad != null) {
            privacidad = privacidad.toUpperCase(); // "publico" -> "PUBLICO"
            nuevaPublicacion.setPrivacidad(
                    Publicaciones.Privacidad.valueOf(privacidad)
            );
        } else {
            nuevaPublicacion.setPrivacidad(Publicaciones.Privacidad.PUBLICO);
        }

        nuevaPublicacion.setEtiquetas(etiquetas);

        //Usuario fijo (ID = 1), cambiar próximamente
        nuevaPublicacion.setUsuarioId(1);


        nuevaPublicacion.setFechaPublicacion(new Timestamp(System.currentTimeMillis()));

        //Guardar la publicación
        boolean publicada = gestorPublicaciones.crearPublicacion(nuevaPublicacion);

        //Redirigir
        if (publicada) {
            //Si el INSERT fue correcto
            response.sendRedirect("ControladorFeed");
        } else {
            //no
            response.sendRedirect("vista/IU_CrearPublicaciones.jsp?error=No se pudo crear la publicación");
        }
    }
}
