/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author benjamin rios
 */
public class Cliente {
    private String nombreCliente;
    private String apellidoCliente;
    private String cedulaCliente;
    private Integer numHerederos;
    private Integer numPropiedad;

    public Cliente(String NombreCliente, String ApellidoCliente, String CedulaCliente, Integer NumHerederos, Integer NumPropiedad) {
        this.nombreCliente = NombreCliente;
        this.apellidoCliente = ApellidoCliente;
        this.cedulaCliente = CedulaCliente;
        this.numHerederos = NumHerederos;
        this.numPropiedad = NumPropiedad;
    }
    
    public Cliente(){
        
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public String getCedulaCliente() {
        return cedulaCliente;
    }

    public void setCedulaCliente(String cedulaCliente) {
        this.cedulaCliente = cedulaCliente;
    }

    public Integer getNumHerederos() {
        return numHerederos;
    }

    public void setNumHerederos(Integer numHerederos) {
        this.numHerederos = numHerederos;
    }

    public Integer getNumPropiedad() {
        return numPropiedad;
    }

    public void setNumPropiedad(Integer numPropiedad) {
        this.numPropiedad = numPropiedad;
    } 
}