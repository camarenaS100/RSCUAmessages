    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="modulo.gestorConfiguracion.Configuracion" %>
    <html>
    <head>
        <!-- Las cabeceras y estilos se mantienen igual -->
    </head>
    <body>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: ${sessionScope.esOscuro ? '#121212' : 'white'};
            color: ${sessionScope.esOscuro ? 'white' : 'black'};
            margin: 0;
            padding: 0;
        }

        .barra {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            background-color: ${sessionScope.esOscuro ? '#1e1e1e' : 'white'};
            border-bottom: 1px solid ${sessionScope.esOscuro ? '#333' : 'black'};
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

        .barra .busqueda {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid ${esOscuro ? '#555' : 'black'};
            border-radius: 15px;
            padding: 5px 10px;
            background-color: ${esOscuro ? '#444' : 'white'};
            width: 600px;
        }

        .barra .busqueda input {
            border: none;
            outline: none;
            flex-grow: 1;
            padding: 5px;
            font-size: 16px;
            background-color: transparent;
            color: inherit;
        }

        .barra .busqueda button img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .configuraciones {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#555' : 'black'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#333' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .configuraciones h1 {
            font-size: 32px;
            margin-bottom: 20px;
            text-align: left;
        }

        .configuraciones button {
            display: flex;
            align-items: center;
            margin: 15px 0;
            background-color: transparent;
            border: none;
            font-size: 18px;
            cursor: pointer;
            padding: 10px;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .configuraciones button:hover {
            background-color: ${esOscuro ? '#555' : '#f0f0f0'};
            transform: scale(1.02);
        }

        .configuraciones button img {
            margin-right: 15px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .panel-tema, .panel-idioma, .panel-privacidad {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid ${esOscuro ? '#555' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#3a3a3a' : '#f9f9f9'};
        }

        /* Se controla la visibilidad mediante los atributos en la solicitud */
        .panel-tema {
            display: ${mostrarPanelTema ? 'block' : 'none'};
        }

        .panel-idioma {
            display: ${mostrarPanelIdioma ? 'block' : 'none'};
        }

        .panel-privacidad {
            display: ${mostrarPanelPrivacidad ? 'block' : 'none'};
        }

        .panel button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: ${esOscuro ? '#555' : '#ddd'};
            color: ${esOscuro ? 'white' : 'black'};
        }

        .panel button:hover {
            background-color: ${esOscuro ? '#777' : '#bbb'};
        }
    </style>

    <%
        // Se obtiene el objeto de configuración de la sesión, renombrado a "cfg" para evitar conflictos.
        Configuracion cfg = (Configuracion) session.getAttribute("configuracion");
        if (cfg == null) {
            cfg = new Configuracion();
        }
    %>

    <div class="barra">
        <form action="<c:url value='/ControladorPerfil'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="perfil">
                <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
            </button>
        </form>

        <form action="<c:url value='/ControladorFeed'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="feed">
                <img src="${pageContext.request.contextPath}/vista/imagenes/inicio.jpg" alt="Feed">
            </button>
        </form>

        <form action="<c:url value='/ControladorNotificaciones'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="notificaciones">
                <img src="${pageContext.request.contextPath}/vista/imagenes/notificaciones.png" alt="Notificaciones">
            </button>
        </form>

        <form action="<c:url value='/ControladorComunidades'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="comunidades">
                <img src="${pageContext.request.contextPath}/vista/imagenes/comunidad.png" alt="Comunidades">
            </button>
        </form>

        <div class="busqueda">
            <form action="<c:url value='/ControladorBusqueda'/>" method="post" style="display: flex; align-items: center; width: 100%;">
                <input type="text" name="query" placeholder="Ingresa palabra clave">
                <button type="submit" name="accion" value="buscar">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/busqueda.jpg" alt="Buscar">
                </button>
            </form>
        </div>

        <form action="<c:url value='/ControladorMensajeria'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="chats">
                <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
            </button>
        </form>

        <form action="<c:url value='/ControladorConfiguracion'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="configuracion">
                <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
            </button>
        </form>

        <form action="<c:url value='/ControladorAyuda'/>" method="post" style="display:inline;">
            <button type="submit" name="accion" value="ayuda">
                <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Ayuda">
            </button>
        </form>

        <form action="<c:url value='/ControladorCerrarSesion'/>" method="post" style="display:inline;">
            <button type="submit">
                <img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir">
                <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo" class="logo">
            </button>
        </form>
    </div>
    </body>
    </html>
