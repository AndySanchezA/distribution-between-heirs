<%-- 
    Document   : CambiarPorcentaje
    Created on : 27/07/2020, 11:40:40 PM
    Author     : TOSHIBA
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelo.*"%>
<%@page import="CONTROLADOR.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
            body{
                background-color: #FFF0F5;
            }
            h1{
                text-align: center;
                color: #00FF7F;
            }table{
                color: #000000;
                border-color: #4682B4;
                background-color: #FFDAB9;
                margin: auto;
            }p{
                text-align: center;
                font-family: Blippo, fantasy;
                font-weight: 500;
            }
        </style>
    <body>
        <br><br>
              <form   action="CambiarPorcentaje.jsp"  method="post"    >
        <table border="1">
            <thead>
                <tr>
                    <th>Descripcion propiedad</th>
                     <th>Numero de Heredero</th>
                    <th>Valor de la propiedad</th>
                    <th>Porcentaje </th>
                    <th>Valor a recibir</th>
                   
                 
                </tr>
            </thead>
            <tbody>

                <%
                    for (Propiedad pr : Datos.listado1) {
                        String descripcion=pr.getDescripcion();
                %>                
                <tr> <td><%out.print(descripcion);%></td>
                    
                    <td><%   Tareas t = new Tareas();
                        int numH = t.recuperarNumH(Conexion.obtenerVacio());
                        for (int i = 1; i <= numH; i++) {
                      %>
                      
                      
         <% Double  Porcentaje1 = 50.00;
                     Double Valor1=pr.getValorPropiedad() * (Porcentaje1/100);
                Valor1=Math.round(Valor1*100.0)/100.0;
                      %>
                        
                        <%out.print(i);%></td> 
                    <td><%out.print(pr.getValorPropiedad());%> </td>
                    <%if( descripcion.equals(request.getParameter("bienPropiedad"))){
                    
                    Porcentaje1 = 100-(Double.parseDouble(request.getParameter("porcentajePropiedad")));
                    Valor1=(pr.getValorPropiedad())*(Porcentaje1/100);
                    %>
                     

<%}%>
                    <%if(i==Integer.parseInt(request.getParameter("herederoPropiedad")) && descripcion.equals(request.getParameter("bienPropiedad"))){%>
                        <%
                        Porcentaje1 = (Double.parseDouble(request.getParameter("porcentajePropiedad")));
                     Valor1=(pr.getValorPropiedad())*(Porcentaje1/100);
             Valor1=Math.round(Valor1*100.0)/100.0;
                        %>
                      
                     
          <td><%out.print("%"+Porcentaje1);%></td>
          <td><%out.print(""+Valor1 );%></td>
<%}else{%>
                             
                               
          <td><%out.print("%"+Porcentaje1);%></td>
             <td><%out.print(""+Valor1 );%></td>
                             
                <%}%>
                    
                
                </tr> <td></td> <td>  <%}%>  <td></td><td></td><td>  </td>                  

            <%}%>
        </tbody>
    </table>
    
    
</form>
        
    <table border="1">
       
             <tr> <th><a href="IngresarPropiedad.jsp"> Agregar otra propiedad</a></th></tr>
    
                 <tr> <br></br><th><a href="Final.jsp">Salir</a></th></tr>

</table>
    </body>
</html>
