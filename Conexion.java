/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author TOSHIBA
 */
public class Conexion {
    private static Connection cnn = null;
    public static Connection obtener(String user, String pass) throws SQLException, ClassNotFoundException {
        String url =  "jdbc:sqlserver://localhost:1433;databaseName=PROYECTO4TO", driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        
        if (cnn == null) {
            try {
                Class.forName(driver);
                cnn = DriverManager.getConnection(url, user, pass);
                System.out.println("Conectando...!!!");
            } catch (SQLException ex) {
                System.out.println("Problemas de conexion...!!!");
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                System.out.println("Clase no Encontada...!!!");
                throw new ClassCastException(ex.getMessage());
            }
        }
        return cnn;
    }   
    
    public static Connection obtenerVacio() throws SQLException, ClassNotFoundException {
        String user = "sa";
        String pass= "12345";
        String url =  "jdbc:sqlserver://localhost:1433;databaseName=PROYECTO4TO", driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        if (cnn == null) {
            try {
                Class.forName(driver);
                cnn = DriverManager.getConnection(url, user, pass);
                System.out.println("Conectando...!!!");
            } catch (SQLException ex) {
                System.out.println("Problemas de conexion...!!!");
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                System.out.println("Clase no Encontada...!!!");
                throw new ClassCastException(ex.getMessage());
            }
        }
        return cnn;
    }
    public static void cerrar() throws SQLException {
        if (cnn != null) {
            cnn.close();
        }
    }
}
