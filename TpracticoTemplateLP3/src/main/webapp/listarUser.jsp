<%-- 
    Document   : index
    Created on : 28 ago. 2023, 21:31:44
    Author     : marce
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">Start Bootstrap</a>
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
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
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

                            <a class="nav-link" href="register.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Creación Nuevo Usuario
                            </a>
                            <a class="nav-link" href="cargo.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Puestos de Trabajo
                            </a>
                            <a class="nav-link" href="listarClientes.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Lista de Clientes
                            </a>
                            <div class="sb-sidenav-menu-heading"></div>
                        </div>
                    </div>
                </nav>
            </div>
                               
            <div id="layoutSidenav_content">
                <main>
                      <div class="container-fluid px-4">
                        <h5 class="mt-4">Ir a Lista de Usuarios</h5>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="listarProveedor.jsp">Lista de Proveedores</a></li>
                            <li class="breadcrumb-item active">Proveedores Activos</li>
                        </ol>
                        <form action="Controlador?accion=VolverMenu" method="post">
                            <input type="hidden" name="accion" value="VolverMenu">
                            <input type="submit" value="Volver al Dashboard">
                        </form>
                        <hr>
                        <hr>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <img src="assets/img/paquete.png" style="margin-left: 370px;" />
                                <h1>Lista de Usuarios</h1>
                            </div>
                            <div class="card-body">
                                <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteCategoriaSuccess");
                                    Boolean addCategSuccess = (Boolean) session.getAttribute("addCategSuccess");
                                    Boolean editSuccess = (Boolean) session.getAttribute("editSuccess");
                                    Boolean alertaMarcaCateg = (Boolean) session.getAttribute("alertaMarcaCateg");

                                    if (deleteSuccess != null && deleteSuccess) { %>
                                <div class="alert alert-success" role="alert">Eliminado en forma exitosa!</div>
                                <% session.removeAttribute("deleteCategoriaSuccess");
                                } else if (addCategSuccess != null && addCategSuccess) { %>
                                <div class="alert alert-success" role="alert"> 
                                    Cargo insertado con éxito!
                                </div>
                                <% session.removeAttribute("addCategSuccess");
                                } else if (editSuccess != null && editSuccess) { %>
                                <div class="alert alert-success" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("editSuccess");
                                } else if (alertaMarcaCateg != null && alertaMarcaCateg) { %>
                                <div class="alert alert-danger" role="alert">Debe Seleccionar una Categoria / Marca de la lista</div>
                                <% session.removeAttribute("alertaMarcaCateg");
                                    }%>
                                    
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               
                            </div>
                            <div class="card-body">

                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID Usuario</th>
                                            <th scope="col">Nombre y Apellido</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Rol</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <%
                                        UsuarioDAO dao = new UsuarioDAO();
                                        List<Usuario> list = dao.listarUsu();
                                        Iterator<Usuario> iter = list.iterator();
                                        Usuario user = null;
                                        while (iter.hasNext()) {

                                            user = iter.next();

                                    %>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><%= user.getId_usuario()%></th>
                                            <td><%= user.getNombre()%></td>
                                            <td><%= user.getUsuario()%></td>
                                            <td><%= user.getRol()%></td>

                                            <td>
                                                <a class="btn btn-warning" href="Controlador?accion=getidUser&id=<%= user.getId_usuario()%>" 
                                                   onclick="return confirm('¿Desea Editar los datos?');"
                                                   role="button">Editar</a>
                                                <a class="btn btn-danger" 
                                                   href="Controlador?accion=delete&id=<%= user.getId_usuario()%>"  
                                                   onclick="return confirm('¿Está seguro de eliminar los datos?');"
                                                   role="button">Eliminar</a>
                                            </td>



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
