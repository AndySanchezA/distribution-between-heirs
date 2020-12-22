<%-- 
    Document   : GardarCliente
    Created on : 27/07/2020, 05:30:11 PM
    Author     : TOSHIBA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Modelo.Cliente"%>
<%@page import="CONTROLADOR.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  HttpSession sesion1 = request.getSession();
            Cliente cl;
        boolean flag = false;
            try {
                Integer numH = Integer.parseInt(request.getParameter("heredero"));
                Integer numP = Integer.parseInt(request.getParameter("propiedad"));
                String cedula = request.getParameter("cedula");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                if (numH < 0 || numP < 0) {
                    response.sendRedirect("IngresarCliente.jsp");
                } else {
                    if (cedula.length() == 10) {
                        int tercerDigito = Integer.parseInt(cedula.substring(2, 3));
                        if (tercerDigito < 6) {
                            String user = sesion1.getAttribute("user").toString();
                            String pass = sesion1.getAttribute("pass").toString();
                            int[] coefValCedula = {2, 1, 2, 1, 2, 1, 2, 1, 2};
                            int verificador = Integer.parseInt(cedula.substring(9, 10));
                            int suma = 0;
                            int digito = 0;
                            for (int i = 0; i < (cedula.length() - 1); i++) {
                                digito = Integer.parseInt(cedula.substring(i, i + 1)) * coefValCedula[i];
                                suma += ((digito % 10) + (digito / 10));
                            }
                            if ((suma % 10 == 0) && (suma % 10 == verificador)) {
                                flag = true;
                            }
                            cl = new Cliente(nombre, apellido, cedula, numH, numP);
                            Tareas t = new Tareas();
                            t.InsertarCliente(Conexion.obtener(user,pass), cl);
                        }
                        if (request.getParameter("enviar") != null) {
                            sesion1.setAttribute("heredero", numH);
                            sesion1.setAttribute("propiedad", numP);
                        }
                    } else {
                        response.sendRedirect("IngresarCliente.jsp");
                    }

                    out.println("<h1>Datos Guardados </h1>");
                    out.println("<br/><a href='IngresarPropiedad.jsp'> Ingresar Propiedad <a/>");
                }
            } catch (NumberFormatException ex) {
                out.println("Error, de validación en los datos ingresados ");
                %><br><a href='IngresarCliente.jsp'>Volver a Ingresar</a><%
            } catch (Exception err) {
                out.println("Error, una excepcion en el proceso de validacion");
                %><br><a href='IngresarCliente.jsp'>Volver a Ingresar</a><%
            }
        %>
    </body>
</html>
