<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mensajeria</title>
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

        .comunidades {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : '#f9f9f9'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .comunidades h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .comunidad-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 15px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .comunidad-item:hover {
            transform: scale(1.02);
        }

        .comunidad-info h2 {
            font-size: 20px;
            margin: 0;
        }

        .comunidad-info p {
            font-size: 14px;
            margin: 0;
            color: ${esOscuro ? '#aaa' : '#666'};
        }

        .acciones {
            display: flex;
            gap: 15px;
        }

        .acciones button {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: ${esOscuro ? '#444' : '#ddd'};
            color: ${esOscuro ? 'white' : 'black'};
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .acciones button:hover {
            background-color: ${esOscuro ? '#666' : '#bbb'};
            transform: scale(1.1);
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

    <form action="ControladorConfiguracion" method="post" style="display:inline;">
        <button type="submit" name="accion" value="configuracion">
            <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
        </button>
    </form>

    <form action="ControladorAyuda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="ayuda">
            <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Ayuda">
        </button>
    </form>

    <button><img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir"></button>
    <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo" class="logo">
</div>
<div class="comunidades">
    <h1>Mensajes Entrantes</h1>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Tia Milagros</h2>
            <p>Bendiciones a ti y a tu mama.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Ir al chat</button>
            <button class="Reportar">Marcar como Leido</button>
        </div>
    </div>
    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>El guero</h2>
            <p>Ya traje el queso</p>
        </div>
        <div class="acciones">
            <button class="unirse">Ir al chat</button>
            <button class="Reportar">Marcar como Leido</button>
        </div>
    </div>
    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Juan Mecanico</h2>
            <p>Hola 🥺</p>
        </div>
        <div class="acciones">
            <form action="ControladorChats" method="post">
                <button class="unirse" type="submit" value="accion">Ir al chat</button>
            </form>
            <button class="Reportar">Marcar como Leido</button>
        </div>
    </div>
    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Yo</h2>
            <p>Se envió una foto</p>
        </div>
        <div class="acciones">
            <form action="ControladorChats" method="post">
                <button class="unirse" type="submit" value="accion">Ir al chat</button>
            </form>
            <button class="Reportar">Marcar como Leido</button>
        </div>
    </div>
    </div>

<script>
</script>
</body>
</html>
