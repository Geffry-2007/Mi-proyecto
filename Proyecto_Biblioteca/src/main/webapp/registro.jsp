<%-- 
    Document   : registro
    Created on : 12/09/2025, 11:09:46 a. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- en esta parte del codigo se establece el idioma de la pagina, validacion para telefonos, caracteres especiales y el titulo-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Registro de usuario</title>
        <style>
            /* en body se define el color de la pagina, tipo de fuente, color de la fuente, display, organizacion, alineaccion de los items */
            body {
                background-color: red;
                font-family: Arial, Helvetica, sans-serif;
                color: black;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            /* la decoracion buho es la configuracion de la imagen buho.png */
            .decoracion-buho {
                position: absolute;
                bottom: 20px;
                right: 20px;
                width: 600px;
                z-index: 10; 
}
            /* este bloque es lo que hace aparecer el bloque blanco donde estan los botones */
            .form-box {
                background-color: white;
                padding: 100px;
                border-radius: 20px;
                width: 400px;
            }
            /* el input son los botones donde se mete la informacion, este bloque es la configuracion como tamaño, margen etc */
            input{
                width: 100px;
                padding: 12px;
                margin: 12px 0;
                border: 2px solid #ff2d2d;
                border-radius: 10px;
            }
            /* este bloque es la configuracion del boton registrar que hace la ejecucion */
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
            /* el hover es para que cuando el usuario pase el cursor el boton cambie de opacidad */
            button:hover {
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <!-- en esta parte podremos colocar la imagen buho.png -->
        <img src="buho.png" class="decoracion-buho">
        <!-- en esta division son las cosas que pondremos dentro del cuadro blanco -->
        <div class="form-box">
            <h2>INGRESA LOS SIGUIENTES DATOS</h2>
            <!-- este apartado es el mensaje de error que se pone al no poner todos los datos -->
            <% String mensaje = (String) request.getAttribute("mensaje");
   if (mensaje != null) { %>
    <p style="color: red; font-weight: bold;"><%= mensaje %></p>
<% } %>
            <!-- este es el cuestionario que recolecta los datos y los manda al servlet -->
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
