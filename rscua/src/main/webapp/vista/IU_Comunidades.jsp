<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Comunidades</title>
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
    <h1>Explora Comunidades</h1>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Tecnología</h2>
            <p>Un espacio para los amantes de la tecnología.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Libros</h2>
            <p>Comparte tus libros favoritos y encuentra nuevas recomendaciones.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Gaming</h2>
            <p>Lugar para encontrar a gente con quién jugar.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Arte y Diseño</h2>
            <p>Un lugar para artistas y diseñadores.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Fitness y Salud</h2>
            <p>Comparte tus rutinas, consejos y progreso.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Viajeros del Mundo</h2>
            <p>Intercambia experiencias y consejos de viajes.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Cine y Series</h2>
            <p>Discute tus películas y series favoritas con otros cinéfilos.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>

    <div class="comunidad-item">
        <div class="comunidad-info">
            <h2>Emprendedores</h2>
            <p>Conecta con otros emprendedores y comparte tus ideas.</p>
        </div>
        <div class="acciones">
            <button class="unirse">Unirse</button>
            <button class="reportar">Reportar</button>
        </div>
    </div>
</div>

<script>
    // Animaciones y confirmaciones en botones
    const botones = document.querySelectorAll('.acciones button');
    botones.forEach(boton => {
        boton.addEventListener('click', () => {
            const originalText = boton.innerText;
            boton.innerText = "Procesando...";
            boton.disabled = true; // Deshabilitar mientras se procesa
            setTimeout(() => {
                boton.innerText = originalText === "Unirse" ? "Miembro" : "Reportado";
                boton.disabled = false;
            }, 1000);
        });
    });
</script>
</body>
</html>
