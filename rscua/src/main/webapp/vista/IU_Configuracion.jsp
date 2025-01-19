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
            /* Para modo oscuro, en lugar de usar '#121212', se usa un gris oscuro */
            background-color: ${esOscuro ? '#2e2e2e' : 'white'};
            /* Para modo oscuro se usa texto en gris claro */
            color: ${esOscuro ? '#D3D3D3' : 'black'};
            margin: 0;
            padding: 0;
        }

        .barra {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            /* Ajustamos el fondo en modo oscuro a un gris oscuro (en lugar de negro) */
            background-color: ${esOscuro ? '#333' : 'white'};
            border-bottom: 1px solid ${esOscuro ? '#555' : 'black'};
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

        .panel-tema, .panel-idioma {
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
</head>
<body>

<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="configuraciones">
    <h1>Configuración</h1>

    <!-- Botón para mostrar el panel de cambio de tema -->
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

    <!-- Sección para cambiar otros datos (nombre de usuario, contraseña, foto) -->
    <form action="ControladorConfiguracion" method="post">
        <button type="button">
            <img src="${pageContext.request.contextPath}/vista/imagenes/perfil.jpg" alt="Usuario"> Cambiar nombre de usuario
        </button>
        <button type="button">
            <img src="${pageContext.request.contextPath}/vista/imagenes/contrasenia.jpg" alt="Contraseña"> Cambiar contraseña
        </button>
        <button type="button">
            <img src="${pageContext.request.contextPath}/vista/imagenes/foto.jpg" alt="Foto"> Cambiar foto de perfil
        </button>
        <button type="submit" name="accion" value="mostrarPanelIdioma">
            <img src="${pageContext.request.contextPath}/vista/imagenes/idioma.jpg" alt="Idioma"> Cambiar Idioma
        </button>
    </form>

    <!-- Panel para cambiar el idioma. Se envía el valor del nuevo idioma mediante un menú desplegable -->
    <div class="panel panel-idioma">
        <h2>Selecciona el idioma:</h2>
        <form action="ControladorConfiguracion" method="post">
            <select name="idioma">
                <option value="EN">Inglés</option>
                <option value="ES" selected>Español</option>
                <option value="FR">Francés</option>
            </select>
            <!-- Se asigna la acción 'cambiarIdioma' para que en el controlador se detecte el cambio -->
            <button type="submit" name="accion" value="cambiarIdioma">Cambiar Idioma</button>
        </form>
    </div>

    <!-- Sección para otros ajustes (información principal y privacidad) -->
    <form action="ControladorConfiguracion" method="post">
        <button type="button">
            <img src="${pageContext.request.contextPath}/vista/imagenes/informacion.jpg" alt="Información"> Cambiar información principal
        </button>
        <button type="button">
            <img src="${pageContext.request.contextPath}/vista/imagenes/privacidad.jpg" alt="Privacidad"> Cambiar privacidad de la cuenta
        </button>
    </form>
</div>
</body>
</html>
