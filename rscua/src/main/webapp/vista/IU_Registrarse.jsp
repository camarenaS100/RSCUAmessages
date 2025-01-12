<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="css/RegistrarseStyle.css">
</head>
<body>
<div class="logo">
    <img src="${pageContext.request.contextPath}/vista/imagenes/log_RSCUA.png" alt="Imagen de inicio">
    <div class="glitch"></div>
</div>
<div class="crear">
    <h2>Crear cuenta</h2>
    <form>
        <label for="name">Nombre Completo</label>
        <input type="text" id="name" name="name" required>
        <label for="username">Nombre Usuario</label>
        <input type="text" id="username" name="username" required>
        <label for="phone">Celular</label>
        <input type="tel" id="phone" name="phone" required>
        <label for="email">Correo</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" required><br>
        <button type="button" onclick=window.location.href='${pageContext.request.contextPath}/vista/IU_Feed.jsp'">Registrarse</button>
    </form>
</div>
</body>
</html>