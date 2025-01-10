package modulo.gestorConfiguracion;

import java.util.ArrayList;

public class Configuracion {
    // Atributos
    private String username;
    private String contrasenia;
    private String fotoPerfil;
    private String informacionPrin;
    private Idioma idioma;
    private Privacidad privacidad;
    private Tema tema; // Tema: oscuro o claro
    private ArrayList<String> bloqueados;

    public Configuracion(String username, String contrasenia, String fotoPerfil, String informacionPrin, Idioma idioma, Privacidad privacidad, Tema tema) {
        this.username = username;
        this.contrasenia = contrasenia;
        this.fotoPerfil = fotoPerfil;
        this.informacionPrin = informacionPrin;
        this.idioma = idioma;
        this.privacidad = privacidad;
        this.tema = tema;
        this.bloqueados = new ArrayList<>();
    }
    //llenado de datos, cambiar
    public Configuracion() {
        this("Usuario", "1234", "vista/imagenes/perfil.jpg", "Información de usuario", Idioma.ES, Privacidad.PUBLICA, Tema.CLARO);
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public String getInformacionPrin() {
        return informacionPrin;
    }

    public void setInformacionPrin(String informacionPrin) {
        this.informacionPrin = informacionPrin;
    }

    public Idioma getIdioma() {
        return idioma;
    }

    public void setIdioma(Idioma idioma) {
        this.idioma = idioma;
    }

    public Privacidad getPrivacidad() {
        return privacidad;
    }

    public void setPrivacidad(Privacidad privacidad) {
        this.privacidad = privacidad;
    }

    public Tema getTema() {
        return tema;
    }

    public void setTema(Tema tema) {
        this.tema = tema;
    }

    public ArrayList<String> getBloqueados() {
        return bloqueados;
    }

    public void addBloqueado(String usuario) {
        this.bloqueados.add(usuario);
    }

    public enum Idioma {
        EN, ES, FR
    }


    public enum Privacidad {
        PUBLICA, PRIVADA
    }

    public enum Tema {
        CLARO, OSCURO
    }
}



