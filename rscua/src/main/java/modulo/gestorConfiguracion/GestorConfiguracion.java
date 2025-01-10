package modulo.gestorConfiguracion;

public class GestorConfiguracion {
    private Configuracion configuracion;
    private boolean mostrarPanelTema;
    private boolean mostrarPanelIdioma;
    private static final String API_URL = "https://libretranslate.com/translate";

    public GestorConfiguracion() {
        this.configuracion = new Configuracion();
        this.mostrarPanelTema = false;
        this.mostrarPanelIdioma = false;
    }

    public Configuracion getConfiguracion() {
        return configuracion;
    }

    public void cambiarTemaOscuro() {
        configuracion.setTema(Configuracion.Tema.OSCURO);
    }

    public void cambiarTemaClaro() {
        configuracion.setTema(Configuracion.Tema.CLARO);
    }

    public void cambiarIdioma(Configuracion.Idioma idioma) {
        configuracion.setIdioma(idioma);
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
