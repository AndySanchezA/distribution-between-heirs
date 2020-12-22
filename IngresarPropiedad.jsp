<%-- 
    Document   : IngresarPropiedad
    Created on : 27/07/2020, 05:32:50 PM
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
            }form{
                  margin: auto;
            }
        </style>
    <body>
     
        <hr>
        <h1>Ingresar Propiedad</h1>
        <hr>
        <br>
         <%
            HttpSession sesion1 = request.getSession();
          
        %>

        <form action="GuardarPropiedad.jsp" method="post">
            <table border="1">
                <tr> <th> Valor de la propiedad: </th><th><input type="text" name="vp" ></th></tr>
       
           <tr> <th>Descripcion de la propiedad: </th><th><input type="text" name="des" ></th></tr>
           
      
            </table>
            <br>
       
                     
                <p> <input type="submit" value="Enviar">
               <input type="button" value="Mostrar reticion de bienes" onclick="redireccionamiento()"/></p>
            
        </form> 
      <script type="text/javascript">
    function redireccionamiento(){
        location.href="listar.jsp";
    }
        </script>
    </body>
 
</html>
