<%-- 
    Document   : PropiedadPorcentaje
    Created on : 2/08/2020, 08:26:37 PM
    Author     : TOSHIBA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="CONTROLADOR.*"%>
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
        <form action="CambiarPorcentaje.jsp" method="get">
            <table border="1">
                <%Tareas t = new Tareas();
                    int numH = t.recuperarNumH(Conexion.obtenerVacio());
                    int id = t.recuperarIdCliente(Conexion.obtenerVacio());
                    int numP = t.recuperarNumPropiedadesPorId(Conexion.obtenerVacio(), id);

                %>

                <tr>

                    <th>Ingrese el numero de heredero a cambiar su porcentaje</th><td><input type="text" name="herederoPropiedad"></td>            </tr>
                <tr>   <th>Ingrese el bien a cambiar </th><td><input type="text" name="bienPropiedad"></td>            </tr>
                <tr>     <th>Ingrese el nuevo porcentaje a recibir de su herecia inical  </th><td><input type="text" name="porcentajePropiedad"></td>            </tr>

                </tr>

                

            </table>
                <br>
                <p> <input type="submit" name="botonPropiedad" value="Enviar Cambios"></p>
        </form>
    </body>
</html>
