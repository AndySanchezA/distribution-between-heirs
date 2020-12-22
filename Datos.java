/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import java.util.ArrayList;
import Modelo.*;
import CONTROLADOR.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author TOSHIBA
 */
public class Datos {

    public static ArrayList<Cliente> listado = new ArrayList<>();
    public static List<Propiedad> listado1 = new ArrayList<Propiedad>();

    public void consultarPropiedad(int idCliente) {
        try {
            Conexion c = new Conexion();
            Connection cn = c.obtenerVacio();
            Statement st;
            ResultSet rs;
            ResultSetMetaData md;
            st = cn.createStatement();
            rs = st.executeQuery("SELECT NUM_PROPIEDADES FROM PROPIEDAD" + " WHERE ID_CLIENTE = " + idCliente);
            md = rs.getMetaData();
            int columnas = md.getColumnCount();
            while (rs.next()) {
                Propiedad p = new Propiedad();
                p.setDescripcion(rs.getString("DESCRIPCION_PROPIEDAD"));
                p.setValorPropiedad(rs.getDouble("VALOR_PROPIEDAD"));
                listado1.add(p);
            }
        } catch (Exception e) {
            System.err.println(e);
        }

    }
    
    public void borrarDatosPropiedadArraylist(){
        listado1.clear();
    }

}
