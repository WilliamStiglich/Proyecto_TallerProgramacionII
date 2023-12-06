<%-- 
    Document   : index
    Created on : 28 ago. 2023, 21:31:44
    Author     : marce
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="modelo.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla de Personas</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">Tabla de Personas</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->

        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Opciones</div>
                            <a class="nav-link" href="Controlador?accion=VolverMenu">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>

                            <div class="sb-sidenav-footer">
                                <div class="small">Logged in as:</div>
                                ${usuario}
                            </div>
                            </nav>
                        </div>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Tabla de Personas</h1>


                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table me-1"></i>
                                            DataTabla Personas
                                        </div>
                                        <div class="card-body">


                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Cedula</th>
                                                        <th scope="col">Nombres</th>
                                                        <th scope="col">Apellidos</th>

                                                    </tr>
                                                </thead>
                                                <%
                                                    PersonaDAO dao = new PersonaDAO();
                                                    List<Persona> list = dao.listar();
                                                    Iterator<Persona> iter = list.iterator();
                                                    Persona per = null;
                                                    while (iter.hasNext()) {

                                                        per = iter.next();

                                                %>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row"><%= per.getId_persona()%></th>
                                                        <td><%= per.getCedula()%></td>
                                                        <td><%= per.getNombre()%></td>
                                                        <td><%= per.getApellido()%></td>

                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>



                                        </div>
                                    </div>
                                </div>
                            </main>
                            <footer class="py-4 bg-light mt-auto">
                                <div class="container-fluid px-4">
                                    <div class="d-flex align-items-center justify-content-between small">
                                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                        <div>
                                            <a href="#">Privacy Policy</a>
                                            &middot;
                                            <a href="#">Terms &amp; Conditions</a>
                                        </div>
                                    </div>
                                </div>
                            </footer>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
                    <script src="js/datatables-simple-demo.js"></script>
                    </body>
                    </html>
