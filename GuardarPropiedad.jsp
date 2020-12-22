<%-- 
    Document   : Salida
    Created on : 27/07/2020, 05:34:40 PM
    Author     : TOSHIBA
--%>

<%@page import="java.util.concurrent.ExecutionException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="CONTROLADOR.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
<%try{%>      <%HttpSession sesion1 = request.getSession();
            Double vp = Double.parseDouble(request.getParameter("vp"));
            String dp = request.getParameter("des");
            if (vp >= 0) {
                if (dp != null) {
                    String user = sesion1.getAttribute("user").toString();
                    String pass = sesion1.getAttribute("pass").toString();

                    Tareas t = new Tareas();
                    Integer idC = t.recuperarIdCliente(Conexion.obtener(user, pass));
                    Propiedad p = new Propiedad(dp, vp, idC);
                    t.InsertarPropiedad(Conexion.obtener(user, pass), p);
                    Datos.listado1.add(p);

                    out.print("<h1>ELEMENTO INGRESADO</h1>");
                    out.print("<br/><a href='IngresarPropiedad.jsp'>Volver a ingresar propiedad</a>");
                }
            } else {
                out.print("<h1>ERROR, INSERTO UN NUMERO NEGATO O NO ESCRIBIO UNA DESCRIPCION DE LA PROPIEDAD ELEMENTO NO INGRESADO</h1>");
                out.print("<br/><a href='IngresarPropiedad.jsp'>Volver a inar propiedad</a>");
            }

        %>
<%}catch(Exception e){%>
<H1>DATO MAL INGRESADO</H1>
<a href='IngresarPropiedad.jsp'>Volver a Ingresar</a>
 
<%}%> 

    </body>
</html>
