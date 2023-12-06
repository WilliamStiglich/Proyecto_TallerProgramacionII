/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class conexion {
    Connection cn;
    
    public conexion() {
        try {
            String servidor = "localhost";
            String puerto = "3306";
            String usuario = "root";
            String password = ""; // tu contraseÃ±a
            //String password = "admin"; // tu contraseÃ±a
            String driver = "com.mysql.cj.jdbc.Driver";
            String basedatos = "bd_tallerprogramacion"; //nombre de tu DB
            String cadenaconexion = "jdbc:mysql://" + servidor + ":" + puerto + "/" + basedatos;
            Class.forName(driver);
            cn = DriverManager.getConnection(cadenaconexion, usuario, password);
            System.out.println("conexion:" + cadenaconexion);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error cx: " + e.toString());
        }
    }

    public Connection getConexion() {
        return cn;
    }
    
}
