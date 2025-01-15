package modulo.gestorPublicaciones;

import java.util.Date;

public class Publicaciones {
    // Atributos
    private String id;
    private String usuario;
    private String contenido;
    private String imagen;
    private Date fechaPublicacion;
    private int likes;
    private int comentarios;
    private int compartidos;

    public Publicaciones(String id, String usuario, String contenido, String imagen, Date fechaPublicacion) {
        this.id = id;
        this.usuario = usuario;
        this.contenido = contenido;
        this.imagen = imagen;
        this.fechaPublicacion = fechaPublicacion;
        this.likes = 0;
        this.comentarios = 0;
        this.compartidos = 0;
    }

    public Publicaciones(String id, String usuario, String contenido, Date fechaPublicacion) {
        this(id, usuario, contenido, null, fechaPublicacion);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getComentarios() {
        return comentarios;
    }

    public void setComentarios(int comentarios) {
        this.comentarios = comentarios;
    }

    public int getCompartidos() {
        return compartidos;
    }

    public void setCompartidos(int compartidos) {
        this.compartidos = compartidos;
    }

    public void incrementarLikes() {
        this.likes++;
    }

    public void agregarComentario() {
        this.comentarios++;
    }

    public void compartirPublicacion() {
        this.compartidos++;
    }
}
