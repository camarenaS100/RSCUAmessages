package modulo.gestorMensaje;

import java.util.ArrayList;
import java.util.List;

public class GestorMensaje {
    public List<Mensaje> obtenerMensajes() {
        List<Mensaje> mensajes = new ArrayList<>();
        mensajes.add(new Mensaje("Juan", "Hola, ¿cómo estás?", "2025-01-14"));
        mensajes.add(new Mensaje("María", "¿Vas a venir al evento?", "2025-01-13"));
        mensajes.add(new Mensaje("Carlos", "Te envié los documentos.", "2025-01-12"));
        return mensajes;
    }
}
