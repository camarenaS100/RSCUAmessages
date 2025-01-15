<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Configuración</title>
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

        .configuraciones {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#444' : 'black'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
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
            background-color: ${esOscuro ? '#444' : '#f0f0f0'};
            transform: scale(1.02);
        }

        .configuraciones button img {
            margin-right: 15px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .panel-tema, .panel-idioma {
            display: none;
            margin-top: 20px;
            padding: 20px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
        }

        .panel-tema {
            display: ${mostrarPanelTema ? 'block' : 'none'};
        }

        .panel-idioma {
            display: ${mostrarPanelIdioma ? 'block' : 'none'};
        }

        .panel button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: ${esOscuro ? '#444' : '#ddd'};
            color: ${esOscuro ? 'white' : 'black'};
        }

        .panel button:hover {
            background-color: ${esOscuro ? '#666' : '#bbb'};
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

<div class="configuraciones">
    <h1>Configuración</h1>
    <form action="ControladorConfiguracion" method="post">
        <button type="submit" name="accion" value="mostrarPanelTema">
            <img src="${pageContext.request.contextPath}/vista/imagenes/tema.png" alt="Tema"> Cambiar Tema
        </button>
    </form>
    <div class="panel panel-tema">
        <h2>Selecciona el tema:</h2>
        <form action="ControladorConfiguracion" method="post">
            <button type="submit" name="accion" value="temaOscuro">Modo Oscuro</button>
            <button type="submit" name="accion" value="temaClaro">Modo Claro</button>
        </form>
    </div>
    <form action="ControladorConfiguracion" method="post">
        <button type="button"><img src="${pageContext.request.contextPath}/vista/imagenes/perfil.jpg" alt="Usuario"> Cambiar nombre de usuario</button>
        <button type="button"><img src="${pageContext.request.contextPath}/vista/imagenes/contrasenia.jpg" alt="Contraseña"> Cambiar contraseña</button>
        <button type="button"><img src="${pageContext.request.contextPath}/vista/imagenes/foto.jpg" alt="Foto"> Cambiar foto de perfil</button>
        <button type="submit" name="accion" value="mostrarPanelIdioma">
            <img src="${pageContext.request.contextPath}/vista/imagenes/idioma.jpg" alt="Idioma"> Cambiar Idioma
        </button>
    </form>

    <div class="panel panel-idioma">
        <h2>Selecciona el idioma:</h2>
        <button type="button">Inglés</button>
        <button type="button">Español</button>
        <button type="button">Francés</button>
    </div>

    <form action="ControladorConfiguracion" method="post">
        <button type="button"><img src="${pageContext.request.contextPath}/vista/imagenes/informacion.jpg" alt="Información"> Cambiar información principal</button>
        <button type="button"><img src="${pageContext.request.contextPath}/vista/imagenes/privacidad.jpg" alt="Privacidad"> Cambiar privacidad de la cuenta</button>
    </form>
</div>
</body>
</html>

