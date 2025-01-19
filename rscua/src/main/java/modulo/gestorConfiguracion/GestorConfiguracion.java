package modulo.gestorConfiguracion;

import servicios.ProxyConfiguracion;
import java.sql.SQLException;

public class GestorConfiguracion {
    private ProxyConfiguracion pConfiguracion;
    private Configuracion configuracion;
    private boolean mostrarPanelTema;
    private boolean mostrarPanelIdioma;

    public GestorConfiguracion() {
        try {
            pConfiguracion = new ProxyConfiguracion();
            // Se crea la configuración predeterminada (si no se obtiene de BD)
            configuracion = new Configuracion();
        } catch (SQLException e) {
            System.out.println("\n\nError al usar ProxyConfiguracion para inicializar GestorConfiguracion\n\n");
            e.printStackTrace();
            configuracion = new Configuracion();
        }
        this.mostrarPanelTema = false;
        this.mostrarPanelIdioma = false;
    }

    /**
     * Recupera la configuración actual para el usuario con el id indicado.
     */
    public Configuracion getConfiguracion(int usuarioId) {
        try {
            configuracion = pConfiguracion.obtenerConfiguracion(usuarioId);
            return configuracion;
        } catch (SQLException e) {
            System.out.println("\n\nError al obtener configuración\n\n");
            e.printStackTrace();
            return configuracion;
        }
    }

    /**
     * Cambia el tema a OSCURO para el usuario indicado.
     */
    public boolean cambiarTemaOscuro(int usuarioId) {
        try {
            configuracion.setTema(Configuracion.Tema.OSCURO);
            return pConfiguracion.cambiarTema(usuarioId, Configuracion.Tema.OSCURO);
        } catch (SQLException e) {
            System.out.println("\n\nError al cambiar el tema a OSCURO\n\n");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Cambia el tema a CLARO para el usuario indicado.
     */
    public boolean cambiarTemaClaro(int usuarioId) {
        try {
            configuracion.setTema(Configuracion.Tema.CLARO);
            return pConfiguracion.cambiarTema(usuarioId, Configuracion.Tema.CLARO);
        } catch (SQLException e) {
            System.out.println("\n\nError al cambiar el tema a CLARO\n\n");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Cambia el idioma para el usuario indicado.
     * Ahora idioma es String, se pasa directamente.
     */
    public boolean cambiarIdioma(int usuarioId, String idioma) {
        try {
            configuracion.setIdioma(idioma);
            return pConfiguracion.cambiarIdioma(usuarioId, idioma);
        } catch (SQLException e) {
            System.out.println("\n\nError al cambiar el idioma\n\n");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Cambia la privacidad para el usuario indicado.
     */
    public boolean cambiarPrivacidad(int usuarioId, Configuracion.Privacidad privacidad) {
        try {
            configuracion.setPrivacidad(privacidad);
            return pConfiguracion.cambiarPrivacidad(usuarioId, privacidad);
        } catch (SQLException e) {
            System.out.println("\n\nError al cambiar la privacidad\n\n");
            e.printStackTrace();
            return false;
        }
    }

    public boolean isMostrarPanelTema() {
        return mostrarPanelTema;
    }

    public void mostrarPanelTema(boolean mostrar) {
        this.mostrarPanelTema = mostrar;
    }

    public boolean isMostrarPanelIdioma() {
        return mostrarPanelIdioma;
    }

    public void mostrarPanelIdioma(boolean mostrar) {
        this.mostrarPanelIdioma = mostrar;
    }
}
