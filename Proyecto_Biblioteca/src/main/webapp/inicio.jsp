<%-- 
    Document   : inicio
    Created on : 11/09/2025, 8:39:38 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión - I.E.D Los Santos</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(220, 22, 22);
            color:#000;
            display: flex;
            height: 100vh;
        }
        .left {
            flex: 1;
            display: flex; 
            justify-content: center;
            align-items: flex-start; 
            padding-top: 20vh; 
            padding-left: 20px;
            padding-right: 20px;
            padding-bottom: 20px;
        }
        .left-image {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .right {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
            animation: aparecer 1s ease-out forwards;
            opacity: 0;
            transform: translateY(30px);
        }
        h1 {
            font-size: 40px;
            margin-bottom: 35px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="email"],
        input[type="password"] {
            padding: 16px;
            margin-bottom: 30px;
            border: 2px solid #00004c;
            border-radius: 12px;
            font-size: 18px;
            outline: none;
        }
        button {
            padding: 14px;
            background-color: white;
            border:2px solid #00004c;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #ddd;
        }
        .links {
            margin-top: 15px;
            font-size: 18px;
        }
        .links a {
            color: #004bff;
            text-decoration: none;
            margin-left: 5px;
        }
        .links a:hover {
            text-decoration: underline;
        }
        @keyframes aparecer {
         from {
            opacity: 0;
            transform: translateY(30px);
         }
         to {
            opacity: 1;
            transform: translateY(0);
         }
        }
        .custom-shape-divider-top-1751419049 {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            overflow: hidden;
            line-height: 0;
        }
        .custom-shape-divider-top-1751419049 svg {
            position: relative;
            display: block;
            width: calc(100% + 1.3px);
            height: 183px;
        }
        .custom-shape-divider-top-1751419049 .shape-fill {
            fill: #b30f0f;
        }
    </style>
</head>
<body>
    <div class="left">
        <img src="caminando.png" alt="Ilustración de inicio de sesión" class="left-image">
    </div>

    <div class="right">
        <h1>¡Bienvenido a la plataforma, inicia sesión para continuar!</h1>

        <form action="InicioServlet" method="POST">
            <input type="email" name="email" placeholder="Correo electrónico" required>
            <input type="password" name="contraseña" placeholder="Contraseña" required>
            <button type="submit">Iniciar sesión</button>
        </form>

    <% String mensaje = (String) request.getAttribute("mensaje");
   if (mensaje != null) { %>
   <div style="color: white; font-weight: bold;">
       <%= mensaje %>
   </div>
<% } %>

        <div class="links">
            ¿Todavía no tienes cuenta?
            <a href="registro.jsp">Registrarse</a><br>
            <a href="#">Recordar Contraseña</a>
        </div>
    </div>

    <div class="custom-shape-divider-top-1751419049">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
        </svg>
    </div>
</body>
</html>
