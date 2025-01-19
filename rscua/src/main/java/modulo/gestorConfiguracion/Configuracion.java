package modulo.gestorConfiguracion;

import java.util.ArrayList;

public class Configuracion {
    // Atributos
    private int usuarioId;
    private String username;
    private String contrasenia;
    private String fotoPerfil;
    private String informacionPrin;

    // Ahora el idioma se maneja como String
    private String idioma;
    private Privacidad privacidad;
    private Tema tema; // Tema: CLARO u OSCURO
    private ArrayList<String> bloqueados;

    // Constructor completo (usado cuando se recupera de la BD)
    public Configuracion(int usuarioId, String idioma, Privacidad privacidad, Tema tema) {
        this.usuarioId = usuarioId;
        this.idioma = idioma;
        this.privacidad = privacidad;
        this.tema = tema;
    }

    // Constructor alternativo para otros usos (por ejemplo, para otros cambios en la configuración)
    public Configuracion(String username, String contrasenia, String fotoPerfil, String informacionPrin, String idioma, Privacidad privacidad, Tema tema) {
        this.username = username;
        this.contrasenia = contrasenia;
        this.fotoPerfil = fotoPerfil;
        this.informacionPrin = informacionPrin;
        this.idioma = idioma;
        this.privacidad = privacidad;
        this.tema = tema;
        this.bloqueados = new ArrayList<>();
    }

    // Constructor por defecto
    public Configuracion() {
        // Valores predeterminados; en este ejemplo, usamos "ES" para el idioma
        this("Usuario", "1234", "vista/imagenes/perfil.jpg", "Información de usuario", "ES", Privacidad.MEDIA, Tema.CLARO);
    }

    // Getters y Setters
    public int getUsuarioId() {
        return usuarioId;
    }
    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
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

    public String getIdioma() {
        return idioma;
    }
    public void setIdioma(String idioma) {
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

    // Enums para Privacidad y Tema
    public enum Privacidad {
        ALTA, MEDIA, BAJA
    }
    public enum Tema {
        CLARO, OSCURO
    }
}
