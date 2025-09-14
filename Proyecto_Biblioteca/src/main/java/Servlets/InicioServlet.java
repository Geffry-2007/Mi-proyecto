/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//esto indica que el servlet accede con la ruta /InicioServlet//
@WebServlet("/InicioServlet")
public class InicioServlet extends HttpServlet {

    //conexion con la base de datos//
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_software";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "2007";
    
    //maneja las peticiones POST ya que en inicio.jsp se manda con method=POST//
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //aqui se captura los datos del formulario//
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");

        try {
         
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
            //este apartado consulta si existe un usuario con el email y la contraseña que ingresen en inicio.jsp//
            String sql = "SELECT * FROM usuario WHERE email=? AND contraseña=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, contraseña);

            ResultSet rs = stmt.executeQuery();
            
            //aqui se define el resultado, si encuentra al usuario lo manda a bienvenido.jsp//
            if (rs.next()) {
                request.setAttribute("mensaje", "Inicio de sesión exitoso, bienvenido " + rs.getString("nombre_apellido"));
                request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
            //si no se encuentra, le salta un error y lo devuelve a inicio.jsp//
            } else {
                request.setAttribute("mensaje", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            }

            rs.close();
            stmt.close();
            conn.close();
        //cuando ocurre un error (la base no se conecta) se muestra el error en inicio.jsp//
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error en el login: " + e.getMessage());
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
        }
    }
}

