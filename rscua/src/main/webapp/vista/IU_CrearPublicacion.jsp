<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Publicacion</title>
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

        .post-header {
            margin-top: 20px;
            display: flex;
            align-items: center;
            width: 90%;
            max-width: 400px;
        }

        .post-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .post-header span {
            font-size: 18px;
        }

        .divider {
            width: 90%;
            max-width: 400px;
            border-top: 2px dotted #000;
            margin: 20px 0;
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
            width: 90%; /* Cambiado a porcentaje */
            max-width: 400px; /* Ancho máximo */
            padding: 20px;
            z-index: 2;
            box-sizing: border-box; /* Incluye padding en el ancho total */
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

        .modal textarea {
            width: 100%;
            height: 80px;
            resize: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 14px;
            line-height: 1.5;
            box-sizing: border-box; /* Incluye padding y bordes en el ancho */
        }

        .modal .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .modal .actions button {
            border: none;
            background: none;
            cursor: pointer;
        }

        .modal .actions img {
            width: 24px;
            height: 24px;
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

        @media (max-width: 768px) {
            .post-header img {
                width: 40px;
                height: 40px;
            }

            .post-header span {
                font-size: 16px;
            }

            .modal {
                width: 95%;
            }
        }
    </style>
</head>
<body>
<div class="crear-publicacion">
    <div class="post-header">
        <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
        <span>¿Que estas pensando el dia de hoy?</span>
    </div>
    <div class="divider"></div>

    <div class="overlay" id="overlay"></div>

    <div class="modal" id="modal">
        <div class="user">
            <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
            <span>@Zaganav29</span>
        </div>
        <textarea placeholder="Introduce texto"></textarea>
        <div class="actions">
            <button><img src="${pageContext.request.contextPath}/vista/imagenes/updateImage.jpg" alt="Subir Imagen"></button>
            <button><img src="${pageContext.request.contextPath}/vista/imagenes/ready.jpg" alt="Publicar"></button>
        </div>
    </div>
</div>

<script>
    const overlay = document.getElementById('overlay');
    const modal = document.getElementById('modal');
    const postHeader = document.querySelector('.post-header');
    const body = document.body;

    postHeader.addEventListener('click', () => {
        modal.style.display = 'block';
        overlay.style.display = 'block';
        body.classList.add('no-scroll');
    });

    overlay.addEventListener('click', () => {
        modal.style.display = 'none';
        overlay.style.display = 'none';
        body.classList.remove('no-scroll');
    });

    modal.addEventListener('click', (event) => {
        event.stopPropagation();
    });
</script>
</body>
</html>
