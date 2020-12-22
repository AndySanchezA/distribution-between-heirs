<%-- 
    Document   : IngresarCliente
    Created on : 27/07/2020, 05:32:20 PM
    Author     : TOSHIBA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
            body{
              background-color: #7FFFD4;
            }
            h1{
                text-align: center;
          
            }table{
                  color: #000000;
                border-color: #4682B4;
                background-color: #B0C4DE;
                margin: auto;
            }p{
                text-align: center;
                font-family: Blippo, fantasy;
                font-weight: 500;
            }
        </style>
    <body>
        <hr>
        <h1>Ingresar Datos del Cliente</h1>                
        <hr>
        <br>
       
        <form  action="GuardarCliente.jsp" method="post">

            <table border="1" >

                <tr><th>Cedula: </th><td><input type="text" name="cedula" ></td></tr>

                <tr><th> Nombre: </th><td><input type="text" name="nombre" ></td></tr>

                <tr><th>Apellido: </th><td><input type="text" name="apellido" ></td></tr>

                <tr><th>Numero de Herederos: </th><td><input type="text" name="heredero" ></td></tr>

                <tr><th>Numero de Propiedades: </th><td><input type="text" name="propiedad" ></td></tr>

                
            </table>
            <p>  <input type="submit" name="enviar" value="Siguiente"></p> 
        </form>   
    </body>
</html>
