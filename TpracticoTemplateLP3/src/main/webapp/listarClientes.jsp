<%-- 
    Document   : dashboard
    Created on : 28 ago. 2023, 21:49:28
    Author     : marce
--%>

<%@page import="modelo.Menu"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Persona"%>
<%@page import="modelo.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla de Clientes</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#">Tabla de Clientes</a>
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
                            <a class="nav-link" href="add.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Registrar Nuevos Clientes
                            </a>
                            <a class="nav-link" href="listarUser.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Lista de Usuarios
                            </a>
                            <a class="nav-link" href="listarProveedor.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Lista de Proveedores
                            </a>      

                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Listado de Clientes</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="add.jsp">Registrar Clientes</a></li>
                            <li class="breadcrumb-item active">Clientes</li>
                        </ol>
                        <form action="Controlador?accion=VolverMenu" method="post">
                            <input type="hidden" name="accion" value="VolverMenu">
                            <input type="submit" value="Volver al Dashboard">
                        </form>
                        <hr>
                        <hr>
                        <div class="delete-container">
                            <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteSuccess");
                                Boolean addSuccess = (Boolean) session.getAttribute("addSuccess");
                                Boolean editSuccess = (Boolean) session.getAttribute("editSuccess");
                                Boolean addProdSuccess = (Boolean) session.getAttribute("addProdSuccess");

                                if (deleteSuccess != null && deleteSuccess) { %>
                            <div class="alert alert-success" role="alert">El Cliente se eliminó correctamente</div>
                            <% session.removeAttribute("deleteProdSuccess");
                            } else if (addSuccess != null && addSuccess) { %>
                            <div class="alert alert-success" role="alert">Persona creada con éxito!</div>
                            <% session.removeAttribute("addSuccess");
                            } else if (editSuccess != null && editSuccess) { %>
                            <div class="alert alert-success" role="alert">Editado en forma exitosa!</div>
                            <% session.removeAttribute("editSuccess");
                            } else if (addProdSuccess != null && addProdSuccess) { %>
                            <div class="alert alert-success" role="alert">Producto insertado con exito!</div>
                            <% session.removeAttribute("addProdSuccess");
                                } %>          

                        </div>
                        <div class="card-body">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Cedula</th>
                                        <th scope="col">Nombres</th>
                                        <th scope="col">Apellidos</th>
                                        <th scope="col">direccion</th>
                                        <th scope="col">ciudad</th>
                                        <th scope="col">barrio</th>
                                        <th scope="col">pais</th>
                                        <th scope="col">nacionalidad</th>

                                        <th scope="col">Acciones</th>
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
                                        <td><%= per.getDireccion()%></td>
                                        <td><%= per.getCiudad()%></td>
                                        <td><%= per.getBarrio()%></td>
                                        <td><%= per.getPais()%></td>
                                        <td><%= per.getNacionalidad()%></td>

                                        <td>


                                            <a class="btn btn-warning" href="Controlador?accion=getid&id=<%= per.getId_persona()%>" 
                                               onclick="return confirm('¿Desea Editar los datos?');"
                                               role="button">Editar</a>
                                        </td>
                                        <td>

                                            <a class="btn btn-danger" 
                                               href="Controlador?accion=delete&id=<%= per.getId_persona()%>" 
                                               onclick="return confirm('¿Está seguro de eliminar los datos?');"
                                               role="button">Eliminar</a>
                                        </td>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>


                        </div>
                    </div>
            </div>
        </main>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>




