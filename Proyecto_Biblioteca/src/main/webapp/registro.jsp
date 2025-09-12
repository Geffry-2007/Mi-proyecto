<%-- 
    Document   : registro
    Created on : 12/09/2025, 11:09:46 a. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Registro de usuario</title>
        <style>
            body {
                background-color: red;
                font-family: Arial, Helvetica, sans-serif;
                color: black;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            
            .decoracion-buho {
                position: absolute;
                bottom: 20px;
                right: 20px;
                width: 600px;
                z-index: 10; 
}

            .form-box {
                background-color: white;
                padding: 100px;
                border-radius: 20px;
                width: 400px;
            }
            input{
                width: 100px;
                padding: 12px;
                margin: 12px 0;
                border: 2px solid #ff2d2d;
                border-radius: 10px;
            }
            button {
                background-color: #ff2d2d;
                 color: white;
                 padding: 15px;
                 border: none;
                 border-radius: 10px;
                 width: 100%;
                 font-weight: bold;
                 cursor: pointer;
            }
            button:hover {
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <img src="buho.png" class="decoracion-buho">
        <div class="form-box">
            <h2>INGRESA LOS SIGUIENTES DATOS</h2>
            <% String mensaje = (String) request.getAttribute("mensaje");
   if (mensaje != null) { %>
    <p style="color: red; font-weight: bold;"><%= mensaje %></p>
<% } %>
            <form action="RegistroServlet" method="POST">
                <input type="text" name="nombre_apellido" placeholder="Nombre completo" required>
                <input type="text" name="telefono" placeholder="Teléfono">
                <input type="number" name="edad" min="7" max="50" placeholder="Edad" required>
                <input type="email" name="email" placeholder="Correo electrónico" required>
                <input type="password" name="contraseña" placeholder="Contraseña" required>
                <button type="submit">Registrarse</button>
            </form>
        </div>
    </body>
</html>
