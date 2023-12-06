<%-- 
    Document   : edit
    Created on : 16 ago. 2023, 18:44:59
    Author     : DELL
--%>

<%@page import="modelo.Nacionalidad"%>
<%@page import="modelo.NacionalidadDAO"%>
<%@page import="modelo.Paises"%>
<%@page import="modelo.PaisesDAO"%>
<%@page import="modelo.Barrio"%>
<%@page import="modelo.BarrioDAO"%>
<%@page import="modelo.CiudadDAO"%>
<%@page import="modelo.Ciudad"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/prueba.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            CiudadDAO daoc = new CiudadDAO();
            List<Ciudad> listc = daoc.cargaCiudad();
        %>
        <%
            BarrioDAO daob = new BarrioDAO();
            List<Barrio> listb = daob.cargaBarrio();
        %>
        <%
            PaisesDAO daop = new PaisesDAO();
            List<Paises> listp = daop.cargaPais();
        %>
        <%
            NacionalidadDAO daon = new NacionalidadDAO();
            List<Nacionalidad> listn = daon.cargaNacionalidad();
        %>
        <div class="container py-4">
            <h1>Editar Personas</h1>
            <%
                List<Persona> list = (ArrayList<Persona>) request.getAttribute("list");

                Iterator<Persona> iter = list.iterator();
                Persona per = null;
                if (iter.hasNext()) {

                    per = iter.next();

            %>

            <form method="post" action="Controlador?accion=edit">
                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Id_Persona:</label></p>
                    <input type="text" class="form-control" id="txtid" name="txtid" maxlength="10" value="<%= per.getId_persona()%>"readonly>
                </div>
                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Cedula:</label></p>
                    <input type="text" class="form-control" id="txtcedula" name="txtcedula" maxlength="20" value="<%= per.getCedula()%>">
                </div>
                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput2">Nombres:</label></p>
                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" maxlength="50" value="<%= per.getNombre()%>">
                </div>
                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput2">Apellidos:</label></p>
                    <input type="text" class="form-control" id="txtapellido" name="txtapellido" maxlength="50" value="<%= per.getApellido()%>">
                </div>

                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Dirección:</label></p>
                    <input type="text" class="form-control" id="txtdirecc" name="txtdirecc" maxlength="50" value="<%= per.getDireccion()%>">
                </div>

                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Ciudad de Residencia:</label></p>
                    <select class="form-select" arial-label="Default select example" id="cboListaCiudad" name="cboListaCiudad">     
                        <option selected>Seleccione la Ciudad:</option>
                        <%
                            Iterator<Ciudad> iterc = listc.iterator();
                            Ciudad ciu = null;
                            while (iterc.hasNext()) {
                                ciu = iterc.next();
                        %>
                        <option value="<%=ciu.getId_ciudad()%>"><%= ciu.getCiudad()%></option>
                        <%}%>

                    </select>
                </div>


                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Barrio:</label></p>
                    <select class="form-select" arial-label="Default select example" id="cboListaBarrio" name="cboListaBarrio">     
                        <option selected>Seleccione el Barrio:</option>
                        <%
                            Iterator<Barrio> iterb = listb.iterator();
                            Barrio ba = null;
                            while (iterb.hasNext()) {
                                ba = iterb.next();
                        %>
                        <!--  <a class="nav-link" href=></a> -->
                        <option value="<%=ba.getId_barrio()%>"><%= ba.getBarrio()%></option>
                        <%}%>

                    </select>
                </div>

                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Pais de Origen:</label></p>
                    <select class="form-select" arial-label="Default select example" id="cboListaPais" name="cboListaPais">     
                        <option selected>Seleccione el Pais</option>
                        <%
                            Iterator<Paises> iterp = listp.iterator();
                            Paises pa = null;
                            while (iterp.hasNext()) {
                                pa = iterp.next();
                        %>
                        <!--  <a class="nav-link" href=></a> -->
                        <option value="<%=pa.getId_pais()%>"><%= pa.getPais()%></option>
                        <%}%>

                    </select>
                </div>

                <div class="form-group">
                    <p class="font-weight-bold"><label for="formGroupExampleInput">Nacionalidad:</label></p>
                    <select class="form-select" arial-label="Default select example" id="cboListaNac" name="cboListaNac">     
                        <option selected>Seleccione la Nacionalidad:</option>
                        <%
                            Iterator<Nacionalidad> itern = listn.iterator();
                            Nacionalidad na = null;
                            while (itern.hasNext()) {
                                na = itern.next();
                        %>
                        <!--  <a class="nav-link" href=></a> -->
                        <option value="<%=na.getId_nacionalidad()%>"><%= na.getNacionalidad()%></option>
                        <%}%>

                    </select>
                </div>


                <input type="submit" value="Enviar" name="btnEnviar" class="btn btn-success" />

            </form>

            <%}%>
            <a href="NoESindex.jsp"> Volver a la Lista</a>
        </div>

    </body>
</html>
