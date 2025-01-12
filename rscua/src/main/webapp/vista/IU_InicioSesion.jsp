<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/InicioStyle.css">
</head>
<body>
<div class="logo">
    <img src="${pageContext.request.contextPath}/vista/imagenes/log_RSCUA.png" alt="Imagen de inicio">
    <div class="glitch"></div>
</div>
<div class="iniciar">
    <h2>Iniciar Sesión</h2>
    <form>
        <label for="email">Correo </label>
        <input type="email" id="email" name="email" required>
        <label for="password">Contraseña </label>
        <input type="password" id="password" name="password" required><br>
        <button type="button" onclick="window.location.href='IU_Feed.jsp'">Entrar</button><br>
        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/vista/IU_Registrarse.jsp'">Registrarse</button>
    </form>
</div>
</body>
</html>