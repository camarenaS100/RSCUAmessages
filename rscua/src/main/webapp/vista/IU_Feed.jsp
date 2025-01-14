<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/FeedStyle.css">
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

        <form action="ControladorConfiguracion" method="post" style="display:inline;">
            <button type="submit" name="accion" value="chats">
                <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
            </button>
        </form>

        <form action="ControladorConfiguracion" method="post" style="display:inline;">
            <button type="submit" name="accion" value="configuracion">
                <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
            </button>
        </form>


        <button><img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir"></button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo" class="logo">
    </div>

    <div class="Historias">
        <div class="crear-historia">
            <form action="ControladorHistorias" method="get">
               <button type="submit">Subir Nueva Historia</button>
            </form>
        </div>
        <div class="lista-historias">
            <ul>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-1.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-2.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-3.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-4.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-5.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-6.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-7.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-8.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-9.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-10.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-11.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-12.jpeg"></li>
                <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-13.jpeg"></li>
            </ul>
        </div>
    </div>

    <div class="home">
    </div>
</body>
</html>