<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Interfaz Notificaciones</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: ${esOscuro ? '#121212' : 'white'};
            color: ${esOscuro ? 'white' : 'black'};
            margin: 0;
            padding: 0;
        }

        .barra {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            border-bottom: 1px solid ${esOscuro ? '#333' : 'black'};
            border-radius: 10px;
        }

        .barra img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: transparent;
            padding: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease;
        }

        .barra img:hover {
            transform: scale(1.1);
        }

        .barra button {
            background-color: transparent;
            border: none;
            padding: 0;
            display: inline-flex;
            align-items: center;
            cursor: pointer;
        }

        .busqueda {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid ${esOscuro ? '#444' : 'black'};
            border-radius: 15px;
            padding: 5px 10px;
            background-color: ${esOscuro ? '#333' : 'white'};
            width: 600px;
        }

        .busqueda input {
            border: none;
            outline: none;
            flex-grow: 1;
            padding: 5px;
            font-size: 16px;
            background-color: transparent;
            color: inherit;
        }

        .busqueda button img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        /*============ ESTILOS PARA LAS NOTIFICACIONES ============*/
        .notificaciones {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : '#f9f9f9'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .notificaciones h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: left;
        }

        .notificacion-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            transition: transform 0.3s ease, background-color 0.3s ease, opacity 0.3s ease;
            cursor: pointer;
        }

        .notificacion-item img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .notificacion-info {
            flex-grow: 1;
            margin-left: 15px;
        }

        .notificacion-info h2 {
            font-size: 18px;
            margin: 0;
        }

        .notificacion-info p {
            font-size: 14px;
            margin: 0;
            color: ${esOscuro ? '#aaa' : '#666'};
        }

        .notificacion-item.leida {
            background-color: ${esOscuro ? '#1e1e1e' : '#f0f0f0'};
            opacity: 0.6;
        }

        .notificacion-item:hover {
            transform: scale(1.02);
        }

        .leido-texto {
            font-size: 14px;
            font-style: italic;
            color: ${esOscuro ? '#777' : '#333'};
            margin-left: 15px;
        }
    </style>
</head>
<body>

    <div class="barra">
        <form action="ControladorPerfil" method="post" style="display:inline;">
            <button type="submit" name="accion" value="perfil">
                <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
            </button>
        </form>


        <form action="ControladorFeed" method="post" style="display:inline;">
            <button type="submit" name="accion" value="feed">
                <img src="${pageContext.request.contextPath}/vista/imagenes/inicio.jpg" alt="Feed">
            </button>
        </form>

        <form action="ControladorNotificaciones" method="post" style="display:inline;">
            <button type="submit" name="accion" value="notificaciones">
                <img src="${pageContext.request.contextPath}/vista/imagenes/notificaciones.png" alt="Notificaciones">
            </button>
        </form>
    
        <form action="ControladorComunidades" method="post" style="display:inline;">
            <button type="submit" name="accion" value="comunidades">
                <img src="${pageContext.request.contextPath}/vista/imagenes/comunidad.png" alt="Comunidades">
            </button>
        </form>
    
        <div class="busqueda">
            <form action="ControladorBusqueda" method="post" style="display: flex; align-items: center; width: 100%;">
                <input type="text" name="query" placeholder="Ingresa palabra clave">
                <button type="submit" name="accion" value="buscar">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/busqueda.jpg" alt="Buscar">
                </button>
            </form>
        </div>
    
        <form action="ControladorMensajeria" method="post" style="display:inline;">
            <button type="submit" name="accion" value="chats">
                <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
            </button>
        </form>
    
        <form action="ControladorBusqueda" method="post" style="display:inline;">
            <button type="submit" name="accion" value="configuracion">
                <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
            </button>
        </form>

        <form action="ControladorAyuda" method="post" style="display:inline;">
            <button type="submit" name="accion" value="ayuda">
                <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Ayuda">
            </button>
        </form>
    
        <button>
            <img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir">
        </button>
    
        <!-- Logo -->
        <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo">
    </div>

<div class="notificaciones">
    <h1>Tus notificaciones</h1>
    <div class="notificacion-item" onclick="marcarLeida(this)">
        <img src="${pageContext.request.contextPath}/vista/imagenes/cas.jpg" alt="Perfil">
        <div class="notificacion-info">
            <h2>Casandra Zetina</h2>
            <p>Te mencionó en un comentario</p>
        </div>
    </div>
    <div class="notificacion-item" onclick="marcarLeida(this)">
        <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
        <div class="notificacion-info">
            <h2>Miguel Jiménez</h2>
            <p>Le gustó tu publicación</p>
        </div>
    </div>
    <div class="notificacion-item" onclick="marcarLeida(this)">
        <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
        <div class="notificacion-info">
            <h2>Santiago Camarena</h2>
            <p>Te etiquetó en una publicación</p>
        </div>
    </div>
</div>

<script>
    function marcarLeida(element) {
        if (!element.classList.contains("leida")) {
            element.classList.add("leida");
            const textoLeido = document.createElement("span");
            textoLeido.textContent = "Leída";
            textoLeido.className = "leido-texto";
            element.appendChild(textoLeido);
        }
    }
</script>

</body>
</html>
