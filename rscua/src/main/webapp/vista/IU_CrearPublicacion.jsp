<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Publicación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f3f3f3;
            height: 100vh;
        }
        .crear-publicacion {
            width: 100%;
            max-width: 500px;
            margin-top: 20px;
        }
        .post-header {
            display: flex;
            align-items: center;
            cursor: pointer;
            padding: 10px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .post-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .divider {
            width: 100%;
            height: 2px;
            background-color: #ccc;
            margin: 20px 0;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            padding: 20px;
            z-index: 2;
        }
        .modal .user {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .modal .user img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        /* Ajuste del área de texto */
        .modal textarea {
            width: 100%;
            height: 80px;
            resize: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 14px;
            box-sizing: border-box; /* evita que se desborde */
        }
        .modal label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .modal select,
        .modal input {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        /* Mejora de botones */
        .actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }
        .actions button {
            border: none;
            padding: 10px 16px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }
        .actions button[type="reset"] {
            background-color: #999;
            color: #fff;
        }
        .actions button[type="reset"]:hover {
            background-color: #777;
        }
        .actions button[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }
        .actions button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="crear-publicacion">
    <div class="post-header" id="open-modal">
        <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
        <span>¿Qué estás pensando hoy?</span>
    </div>
    <div class="divider"></div>

    <div class="overlay" id="overlay"></div>

    <div class="modal" id="modal">
        <form action="ControladorPublicaciones" method="post">
            <div class="user">
                <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
                <span>@Zaganav29</span>
            </div>
            <!-- Campo para contenido -->
            <textarea
                    name="contenido"
                    placeholder="¿Qué estás pensando hoy?"></textarea>

            <!-- Selección de tipo de contenido -->
            <label for="tipoContenido">Tipo de Contenido:</label>
            <select name="tipoContenido" id="tipoContenido">
                <option value="texto">Texto</option>
                <option value="imagen">Imagen</option>
                <option value="video">Video</option>
            </select>

            <!-- Campo para etiquetas -->
            <label for="etiquetas">Etiquetas (separadas por comas):</label>
            <input type="text" name="etiquetas" id="etiquetas" placeholder="Ejemplo: naturaleza, tecnología">

            <!-- Selección de privacidad -->
            <label for="privacidad">Privacidad:</label>
            <select name="privacidad" id="privacidad">
                <option value="publico">Público</option>
                <option value="amigos">Amigos</option>
                <option value="privado">Privado</option>
            </select>



            <div class="actions">
                <form action="ControladorFeed" method="post" style="display:inline;">
                    <button type="reset">Cancelar</button>
                </form>
                <button type="submit">Publicar</button>
            </div>
        </form>
    </div>
</div>

<script>
    const overlay = document.getElementById('overlay');
    const modal = document.getElementById('modal');
    const openModal = document.getElementById('open-modal');

    openModal.addEventListener('click', () => {
        modal.style.display = 'block';
        overlay.style.display = 'block';
    });

    overlay.addEventListener('click', () => {
        modal.style.display = 'none';
        overlay.style.display = 'none';
    });
</script>
</body>
</html>

