/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.util.*;
/**
 *
 * @author benjamin
 */
public class Propiedad{
    private String descripcion;
    private Double valorPropiedad;
    private Integer idCliente;

    public Propiedad(String descripcion, Double valorPropiedad, Integer idCliente) {
        this.descripcion = descripcion;
        this.valorPropiedad = valorPropiedad;
        this.idCliente = idCliente;
    }
    public Propiedad(){
        
    }
    
    public Propiedad(String descripcion, Double valorPropiedad){
        this.descripcion = descripcion;
        this.valorPropiedad = valorPropiedad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getValorPropiedad() {
        return valorPropiedad;
    }

    public void setValorPropiedad(Double valorPropiedad) {
        this.valorPropiedad = valorPropiedad;
    }

    public Integer getIdCliente() {
        return idCliente;
    }
}