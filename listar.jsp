<%-- 
    Document   : listar
    Created on : 27/07/2020, 05:34:56 PM
    Author     : TOSHIBA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="CONTROLADOR.*"%>
<!DOCTYPE html>
<html>
    <br>
    <head>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <br>

    <body>
        <br>
        <form   action="PropiedadPorcentaje.jsp"  method="post"    >
            <br><br<br>
            <table border="1">
                <thead>
                    <tr>
                        <th>Descripcion propiedad</th>
                        <th>Valor de la propiedad</th>
                        <th>Numero de Herederos</th>
                        <th>Valor a recibir</th>
                        <th>Porcentaje </th>

                    </tr>
                </thead>
                <tbody>

                    <%
                        Datos d = new Datos();
                        Tareas t = new Tareas();
                        Conexion c = new Conexion();
                        int idCliente = t.recuperarIdCliente(c.obtenerVacio());
                        d.consultarPropiedad(idCliente);
                        for (Propiedad pr : Datos.listado1) {
                    %>                
                    <tr> <td><%out.print(pr.getDescripcion());%></td>
                        <td><%out.print(pr.getValorPropiedad());%> </td>
                        <td><%
                            int numH = t.recuperarNumH(Conexion.obtenerVacio());
                            for (int i = 1; i <= numH; i++) {%>
                            <%out.print(i);%></td>              <td><%out.print("" + pr.getValorPropiedad() / numH);%></td>
                        <td> <%out.print(((pr.getValorPropiedad() / numH) * 100) / pr.getValorPropiedad() + "%");%></td>


                    </tr> <td></td><td></td> <td>  <%}%>  <td></td><td></td>  </td>                  

                <%}%>
                </tbody>
            </table>



            <p>
                <br>

            <input type="submit" name="botporc" value="cambiar porcentaje" >
                <br>     <br>
               
                     <a href="LogIn.jsp"> Ingresar nuevo usuario</a>
            </p>



        </form>


    </body>

</html>
