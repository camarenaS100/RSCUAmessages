<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil</title>
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
        /* Foto de perfil e información principal */


        .perfil-header {
            text-align: center;
            padding: 20px;
            background-color: black;
            color: white;
            border-bottom: 2px solid ${esOscuro ? '#333' : 'black'};
        }

        .perfil-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 10px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .perfil-header img:hover {
            transform: scale(1.1);
        }

        .perfil-header h1 {
            font-size: 24px;
        }

        .perfil-header p {
            font-size: 16px;
            color: ${esOscuro ? '#aaa' : '#666'};
        }

        .informacion {
            margin: 20px auto;
            padding: 20px;
            max-width: 900px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .informacion div {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .informacion div:hover {
            transform: scale(1.05);
        }

        .informacion img {
            width: 30px;
            height: 30px;
            margin-bottom: 10px;
        }

        .publicacion {
            margin: 20px auto;
            max-width: 900px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .publicacion-header {
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .publicacion-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .publicacion-header div {
            display: flex;
            flex-direction: column;
            gap: 2px; /* Ajuste del espacio */
        }

        .publicacion-body {
            padding: 10px;
        }

        .publicacion-body img {
            width: 100%;
            border-radius: 15px;
            cursor: pointer;
            transition: opacity 0.3s ease, transform 0.2s ease;
        }

        .publicacion-body img:hover {
            opacity: 0.9;
            transform: scale(1.02);
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

    <form action="ControladorBusqueda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="chats">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
        </button>
    </form>

    <form action="ControladorBusqueda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="configuracion">
            <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
        </button>
    </form>

    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir">
    </button>

    <!-- Logo -->
    <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo">
</div>

<div class="perfil-header">
    <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Foto de Perfil" onclick="alert('Perfil seleccionado')">
    <h1>Iván Garrido Velázquez</h1>
    <p>@Ivan</p>
</div>

<div class="informacion">
    <div>
        <img src="${pageContext.request.contextPath}/vista/imagenes/escuela.jpg" alt="Escuela">
        <p>Estudia en 'UAM Cuajimalpa'</p>
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/vista/imagenes/relacion.jpg" alt="Relación">
        <p>En una relación con 'CasZrd'</p>
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/vista/imagenes/ubicacion.jpg" alt="Ubicación">
        <p>Vive en CDMX</p>
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/vista/imagenes/musica.jpg" alt="Música">
        <p>Escuchando: 'Confieso - Kanye García'</p>
    </div>
    <div>
        <h2>Seguidores</h2>
        <p onclick="alert('Mostrando Seguidores')">666</p>
    </div>
    <div>
        <h2>Seguidos</h2>
        <p onclick="alert('Mostrando Seguidos')">777</p>
    </div>
</div>

<div class="publicacion">
    <div class="publicacion-header">
        <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Foto de Perfil">
        <div>
            <h3 style="margin: 0;">Iván Garrido Velázquez</h3>
            <p style="margin: 0; color: gray;">@Ivan</p>
        </div>
    </div>
    <div class="publicacion-body">
        <p>Hola</p>
        <img src="${pageContext.request.contextPath}/vista/imagenes/publicacionIvan.jpg" alt="Publicación" onclick="alert('Imagen seleccionada')">
    </div>
</div>


</body>
</html>

