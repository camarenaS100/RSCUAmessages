<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ayuda</title>
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

        .barra .busqueda {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid ${esOscuro ? '#444' : 'black'};
            border-radius: 15px;
            padding: 5px 10px;
            background-color: ${esOscuro ? '#333' : 'white'};
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

        .ayuda-container {
            margin: 20px auto;
            max-width: 900px;
            padding: 20px;
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border: 1px solid ${esOscuro ? '#444' : 'black'};
        }

        .ayuda-titulo {
            font-size: 32px;
            margin-bottom: 20px;
            text-align: center;
            border-bottom: 1px solid ${esOscuro ? '#444' : '#ccc'};
            padding-bottom: 10px;
        }

        .ayuda-secciones {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .ayuda-seccion {
            width: 250px;
            padding: 15px;
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .ayuda-seccion:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .ayuda-seccion img {
            width: 50px;
            height: 50px;
            margin-bottom: 10px;
        }

        .ayuda-acerca-de {
            margin-top: 30px;
            padding: 20px;
            border-radius: 15px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            text-align: center;
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

    <form action="ControladorAyuda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="ayuda">
            <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Ayuda">
        </button>
    </form>


    <button><img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir"></button>
    <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo" class="logo">
</div>

<div class="ayuda-container">
    <div class="ayuda-titulo">Asistencia y Ayuda</div>
    <div class="ayuda-secciones">
        <div class="ayuda-seccion" onclick="alert('Preguntas Generales seleccionadas')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/informacion.jpg" alt="Preguntas">
            <p>Preguntas Generales</p>
        </div>
        <div class="ayuda-seccion" onclick="alert('Seguimiento de Reportes seleccionado')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/reportes.png" alt="Reportes">
            <p>Seguimiento de Reportes</p>
        </div>
        <div class="ayuda-seccion" onclick="alert('Chat de Asistencia seleccionado')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chatasis.png" alt="Chat">
            <p>Chat de Asistencia</p>
        </div>
    </div>

    <div class="ayuda-acerca-de">
        <h2>Acerca de Nosotros</h2>
        <p>Esta red social fue creada como parte del proyecto de la uea "Desarrollo a Gran Escala" impartida por el Profesor Pedro Pablo González Pérez.</p>
    </div>
</div>
</body>
</html>

