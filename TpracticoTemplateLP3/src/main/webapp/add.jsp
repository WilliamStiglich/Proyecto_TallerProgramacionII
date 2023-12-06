<%-- 
    Document   : add
    Created on : 16 ago. 2023, 18:44:44
    Author     : DELL
--%>

<%@page import="modelo.Nacionalidad"%>
<%@page import="modelo.NacionalidadDAO"%>
<%@page import="modelo.Paises"%>
<%@page import="modelo.PaisesDAO"%>
<%@page import="modelo.Barrio"%>
<%@page import="modelo.BarrioDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CiudadDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Ciudad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Clientes</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/prueba.css" rel="stylesheet" type="text/css"/>



        <% if (request.getAttribute("CedulaExistente") != null && (boolean) request.getAttribute("CedulaExistente")) { %>
    <div class="alert alert-danger" role="alert">
        Ya existe una persona asociada al num. de Cedula cargado.
    </div>
    <% }%>



</head>
<body>

    <%
        CiudadDAO daoc = new CiudadDAO();
        List<Ciudad> list = daoc.cargaCiudad();
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
        <h1>Crear Clientes</h1>
        <a class="nav-link" href="Controlador?accion=VolverMenu">
            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
            Volver a Dashboard -->
        </a>
        <h5>Ingrese los datos:</h5>
        <form method="post" action="Controlador?accion=add">
            <div class="form-group">
                <p class="font-weight-bold"><label for="formGroupExampleInput">Cedula:</label></p>
                <input type="text" class="form-control" id="txtcedula" name="txtcedula" placeholder="Ingrese la cedula">
            </div>
            <div class="form-group">
                <p class="font-weight-bold"><label for="formGroupExampleInput">Nombres:</label></p>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" placeholder="Ingrese los nombres">
            </div>
            <div class="form-group">
                <p class="font-weight-bold"><label for="formGroupExampleInput">Apellidos:</label></p>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido" placeholder="Ingrese los apellidos">
            </div>
            <div class="form-group">
                <p class="font-weight-bold"><label for="formGroupExampleInput">Dirección:</label></p>
                <input type="text" class="form-control" id="txtdirecc" name="txtdirecc" placeholder="Ingrese la dirección">
            </div>
            <div class="form-group">
                <p class="font-weight-bold"><label for="formGroupExampleInput">Ciudad de Residencia:</label></p>
                <select class="form-select" arial-label="Default select example" id="cboListaCiudad" name="cboListaCiudad">     
                    <option selected>Seleccione la Ciudad:</option>
                    <%
                        Iterator<Ciudad> iterc = list.iterator();
                        Ciudad ciu = null;
                        while (iterc.hasNext()) {
                            ciu = iterc.next();
                    %>
                    <!--  <a class="nav-link" href=></a> -->
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
        <a href="listarClientes.jsp"> Volver a la Tabla de Clientes: Datos de Clientes</a>
    </div>
</body>
</html>
