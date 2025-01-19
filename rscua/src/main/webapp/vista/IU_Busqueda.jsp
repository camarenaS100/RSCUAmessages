<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Búsqueda</title>
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

        .resultados {
            margin: 20px auto;
            padding: 20px;
            max-width: 900px;
            border: 1px solid ${esOscuro ? '#444' : 'black'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .resultados h1 {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: left;
        }

        .perfil-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .perfil-item:hover {
            transform: scale(1.02);
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .perfil-item img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .perfil-info {
            display: flex;
            flex-direction: column;
        }

        .perfil-info h2 {
            font-size: 20px;
            margin: 0;
        }

        .perfil-info p {
            font-size: 16px;
            margin: 0;
            color: ${esOscuro ? '#aaa' : '#666'};
        }

        .acciones {
            display: flex;
            gap: 10px;
        }

        .acciones button {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: ${esOscuro ? '#444' : '#ddd'};
            color: ${esOscuro ? 'white' : 'black'};
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .acciones button:hover {
            background-color: ${esOscuro ? '#666' : '#bbb'};
            transform: scale(1.05);
        }

        .publicaciones {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .publicaciones img {
            width: 280px;
            height: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .publicaciones img:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .descripcion-post {
            font-size: 18px;
            margin-top: 10px;
            color: ${esOscuro ? '#aaa' : '#333'};
        }
    </style>
</head>
<body>
<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="resultados">
    <h1>Búsquedas relacionadas con: CasZer29</h1>
    <div class="perfil-item">
        <img src="${pageContext.request.contextPath}/vista/imagenes/cas.jpg" alt="Perfil">
        <div class="perfil-info">
            <h2>Casandra Zetina</h2>
            <p>@CasZer29</p>
        </div>
        <div class="acciones">
            <button>Seguir</button>
            <button>Bloquear</button>
        </div>
    </div>
    <div class="descripcion-post">Un día fantástico.</div>
    <div class="publicaciones">
        <img src="${pageContext.request.contextPath}/vista/imagenes/p1.jpg" alt="Post 1">
        <img src="${pageContext.request.contextPath}/vista/imagenes/p2.jpg" alt="Post 2">
    </div>
</div>
</body>
</html>
