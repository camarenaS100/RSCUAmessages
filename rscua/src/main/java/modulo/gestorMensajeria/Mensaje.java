package modulo.gestorMensajeria;

public class Mensaje {
    private String remitente;
    private String texto;
    private String fecha;

    public Mensaje(String remitente, String texto, String fecha) {
        this.remitente = remitente;
        this.texto = texto;
        this.fecha = fecha;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

}
