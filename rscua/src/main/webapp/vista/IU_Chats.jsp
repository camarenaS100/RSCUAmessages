<%--
  Created by IntelliJ IDEA.
  User: maik2002
  Date: 18/01/25
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="vista/css/ChatsStyle.css">
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
        <form action="ControladorConfiguracion" method="post" style="display: flex; align-items: center; width: 100%;">
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

<div class="chats-feed">
    <div class="chats-foto">
        <img src="${pageContext.request.contextPath}/vista/imagenes/Chats_usuario.jpeg">
    </div>
    <div class="chats-nombre">
        <p>Usuario</p>
    </div>
    <div class="chats-elementos">
        <form>
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats-telefono.png">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats-videollamada.png">
        </form>
    </div>
    <div class="chats-usuario">
        <p>Hola</p>
    </div>
    <div class="chats-amigo">
        <p>Hola</p>
    </div>
    <div class="chats-usuario">
        <p>¿Como estas?</p>
    </div>
    <div class="chats-amigo">
        <p>Bien gracias</p>
    </div>
    <div class="chats-usuario">
        <p>Que bien</p>
    </div>
    <div class="chats-amigo">
        <p>Si</p>
    </div>
</div>
<div class="chats-acciones">
    <form>
        <label for="mensaje">Escribir mensaje</label>
        <input type="text" id="mensaje" name="mensaje">
        <button type="submit">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats-palomita.png">
        </button>
    </form>
    <img src="${pageContext.request.contextPath}/vista/imagenes/chats-mas.png">
    <img src="${pageContext.request.contextPath}/vista/imagenes/chats-ubicacion.png">
</div>

</body>
</html>
