package modulo.gestorPerfil;

import java.util.ArrayList;
import java.util.List;

public class Perfil {
    // Atributos
    private String nombre;
    private String username;
    private String descripcion;
    private String fotoPerfil;
    private List<String> seguidores;
    private List<String> seguidos;
    private List<String> publicaciones;

    public Perfil(String nombre, String username, String descripcion, String fotoPerfil) {
        this.nombre = nombre;
        this.username = username;
        this.descripcion = descripcion;
        this.fotoPerfil = fotoPerfil;
        this.seguidores = new ArrayList<>();
        this.seguidos = new ArrayList<>();
        this.publicaciones = new ArrayList<>();
    }

    public Perfil() {
        this("Usuario", "@usuario", "Sin descripción", "default.jpg");
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public List<String> getSeguidores() {
        return seguidores;
    }

    public List<String> getSeguidos() {
        return seguidos;
    }

    public List<String> getPublicaciones() {
        return publicaciones;
    }

    public void agregarSeguidor(String seguidor) {
        seguidores.add(seguidor); //sql
    }

    public void eliminarSeguidor(String seguidor) {
        seguidores.remove(seguidor); //sql
    }

    public void agregarSeguido(String seguido) {
        seguidos.add(seguido); //sql
    }

    public void eliminarSeguido(String seguido) {
        seguidos.remove(seguido); //sql
    }

    public void agregarPublicacion(String publicacion) {
        publicaciones.add(publicacion); //sql
    }

    public void eliminarPublicacion(String publicacion) {
        publicaciones.remove(publicacion); //sql
    }
}
