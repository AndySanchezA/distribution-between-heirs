/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import java.util.Stack;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import Modelo.*;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.Queue;

public class Tareas {

    private final String tabla1 = "CLIENTE";
   
    private final String tabla3 = "PROPIEDAD";

    public Tareas() {

    }

    public void InsertarCliente(Connection c, Cliente cl) {
        PreparedStatement consulta;
        try {
            consulta = c.prepareStatement("INSERT INTO " + this.tabla1 + "(CEDULA_CLIENTE, NOMBRE_CLIENTE, APELLIDO_CLIENTE, NUM_PROPIEDADES, NUM_HEREDEROS) VALUES(?,?,?,?,?)");
            consulta.setString(1, cl.getCedulaCliente());
            consulta.setString(2, cl.getNombreCliente());
            consulta.setString(3, cl.getApellidoCliente());
            consulta.setInt(4, cl.getNumPropiedad());
            consulta.setInt(5, cl.getNumHerederos());
            consulta.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error");
        }
    }

    public void InsertarPropiedad(Connection c, Propiedad p) {
        PreparedStatement consulta;
        try {
            consulta = c.prepareStatement("INSERT INTO " + this.tabla3 + " (DESCRIPCION_PROPIEDAD, VALOR_PROPIEDAD, ID_CLIENTE) VALUES(?,?,?)");
            consulta.setString(1, p.getDescripcion());
            consulta.setDouble(2, p.getValorPropiedad());
            consulta.setInt(3, p.getIdCliente());
            consulta.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error");
        }
    }

    public void ActualizarPropiedad(Connection c, Propiedad p, int id_p) {
        PreparedStatement actualizar;
        try {
            actualizar = c.prepareStatement("UPDATE " + this.tabla1 + " SET DESCRIPCION_PROPIEDAD = ?, VALOR_PROPIEDAD = ? WHERE ID_POPIEDAD = ?");
            actualizar.setString(1, p.getDescripcion());
            actualizar.setDouble(2, p.getValorPropiedad());
            actualizar.setInt(3, id_p);
            actualizar.executeUpdate();
        } catch (SQLException e) {
            System.err.print("Error");
        }
    }

    public List<Cliente> recuperarCliente(Connection c) throws SQLException {
        List<Cliente> clie = new ArrayList<>();
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT CEDULA_CLIENTE, NOMBRE_CLIENTE, APELLIDO_CLIENTE, NUM_PROPIEDADES, NUM_HEREDEROS FROM " + this.tabla1 + " ORDER BY NOMBRE_CLIENTE");
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                clie.add(new Cliente(resultado.getString("CEDULA_CLIENTE"), resultado.getString("NOMBRE_CLIENTE"), resultado.getString("APELLIDO_CLIENTE"), resultado.getInt("NUM_PROPIEDADES"), resultado.getInt("NUM_HEREDEROS")));
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return clie;
    }

    public List<Propiedad> recuperarPropiedad(Connection c, int idCliente) throws SQLException {
        List<Propiedad> prop = new ArrayList<>();
        try {

            PreparedStatement consulta = c.prepareStatement("SELECT DESCRIPCION_PROPIEDAD, VALOR_PROPIEDAD FROM " + this.tabla3 + "WHERE ID_CLIENTE = " + idCliente);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                prop.add(new Propiedad(resultado.getString("DESCRIPCION_PROPIEDAD"), resultado.getDouble("VALOR_PROPIEDAD"), resultado.getInt("ID_CLIENTE")));
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return prop;
    }

    public Integer recuperarIdCliente(Connection c) throws SQLException {
        Integer IDCliente = 0;
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT ID_CLIENTE FROM " + this.tabla1);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                IDCliente = resultado.getInt("ID_CLIENTE");
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return IDCliente;
    }
    
     public Integer recuperarUltimoIdCliente(Connection c) throws SQLException {
        Integer IDCliente = 0;
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT MAX(ID_CLIENTE) FROM " + this.tabla1);
            ResultSet resultado = consulta.executeQuery();
            IDCliente = resultado.getInt("ID_CLIENTE");
            
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return IDCliente;
    }
    

    public List<String> recuperarCedula(Connection c) throws SQLException {
        List<String> IDCliente = new ArrayList();
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT CEDULA FROM " + this.tabla1);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                IDCliente.add(resultado.getString("CEDULA"));
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return IDCliente;
    }

    public Integer recuperarNumH(Connection c) throws SQLException {
        Integer NUMH = 0;
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT NUM_HEREDEROS FROM " + this.tabla1);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                NUMH = resultado.getInt("NUM_HEREDEROS");
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return NUMH;
    }

    public int recuperarNumPropiedadesPorId(Connection c, int idC) throws SQLException {
        int numP = 0;
        try {
            PreparedStatement consulta = c.prepareStatement("SELECT NUM_PROPIEDADES FROM " + this.tabla1 + " WHERE ID_CLIENTE = " + idC);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                numP = resultado.getInt("NUM_PROPIEDADES");
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return numP;

    }

}
