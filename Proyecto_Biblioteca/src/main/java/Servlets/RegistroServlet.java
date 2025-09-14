/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    
    //conexion con la base de datos//
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_software";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "2007";
    
    //maneja las peticiones POST de registro.jsp//
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //captura de datos del formulario//
        //cada getParameter es un name de de los <input> de registro.jsp//
        String nombre_apellido = request.getParameter("nombre_apellido");
        String telefono = request.getParameter("telefono");
        String edad = request.getParameter("edad");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");
        
        //conexion a la base de datos con el driver JDBC//
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
            //aqui se inserta los datos del formulario, cada ? se reemplazan por los datos del formulario//
            String sql = "INSERT INTO usuario (nombre_apellido, telefono, edad, email, contraseña,  rol) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nombre_apellido);
            stmt.setString(2, telefono);
            stmt.setString(3, edad);
            stmt.setString(4, email);
            stmt.setString(5, contraseña);
            stmt.setString(6, "usuario"); //el rol se establece automaticamente como usuario//

            //en este apartado se ejecuta y se verifica el proceso//
            int filas = stmt.executeUpdate();

            //si el numero de filas es mayor a 0, significa que el registro fue exitoso//
            if (filas > 0) {
                request.setAttribute("mensaje", "Registro exitoso");
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            //si no se cumple, aparece un mensaje y te devuelve a registro.jsp//    
            } else {
                request.setAttribute("mensaje", "No se pudo registrar");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }

            stmt.close();
            conn.close();
        
        //cuando ocurre un error (la base no se conecta) se muestra el error en resgistro.jsp//
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error: " + e.getMessage());
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}
