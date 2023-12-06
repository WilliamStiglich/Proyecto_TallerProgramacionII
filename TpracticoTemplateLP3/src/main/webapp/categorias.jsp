
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Marcas"%>
<%@page import="modelo.MarcasDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.CategoriaDAO"%>
<%@page import="modelo.Menu"%>
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
        <title>Registrar Categorias</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="productos.jsp">Menu Categorias</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->

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

                            <a class="nav-link" href="productos.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Registrar Productos
                            </a>
                            <a class="nav-link" href="marcas.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Marcas
                            </a>
                            <a class="nav-link" href="stock.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Inventario
                            </a>
                            <div class="sb-sidenav-menu-heading"></div>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h5 class="mt-4">Ir a Lista de Marcas</h5>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="marcas.jsp">Marcas</a></li>
                            <li class="breadcrumb-item active">Productos</li>
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
                                <h1>Registrar Categorias</h1>
                            </div>
                            <div class="card-body">
                                <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteCategoriaSuccess");
                                    Boolean addCategSuccess = (Boolean) session.getAttribute("addCategSuccess");
                                    Boolean editSuccess = (Boolean) session.getAttribute("editCategSuccess");
                                    Boolean alertaMarcaCateg = (Boolean) session.getAttribute("alertaMarcaCateg");

                                    if (deleteSuccess != null && deleteSuccess) { %>
                                <div class="alert alert-success" role="alert">Eliminado en forma exitosa!</div>
                                <% session.removeAttribute("deleteCategoriaSuccess");
                                } else if (addCategSuccess != null && addCategSuccess) { %>
                                <div class="alert alert-success" role="alert"> 
                                    Categoria insertada con éxito!
                                </div>
                                <% session.removeAttribute("addCategSuccess");
                                } else if (editSuccess != null && editSuccess) { %>
                                <div class="alert alert-success" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("editCategSuccess");
                                } else if (alertaMarcaCateg != null && alertaMarcaCateg) { %>
                                <div class="alert alert-danger" role="alert">Debe Seleccionar una Categoria / Marca de la lista</div>
                                <% session.removeAttribute("alertaMarcaCateg");
                                    }%>

                                <table class="table table-hover">
                                    <form method="post" action="Controlador?accion=insertCategoria">
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput">Categoria:</label></p>
                                            <input type="text" class="form-control" id="txtCategoria" name="txtCategoria" placeholder="Ingrese la Categoria">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Registrar</button>
                                        <script>
                                            function limpiar() {
                                                txtCategoria.value = "";
                                            }
                                        </script>
                                        <a href="#" class="btn btn-danger" style="margin-left: 15px;" onclick="limpiar();">Cancelar</a>             
                                        <!-- <a href="#" class="btn btn-danger" style="margin-left: 15px;">Cancelar</a> -->

                                        <div class="card-body">

                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID de Categoria</th>
                                                        <th scope="col">Categoria</th>
                                                        <th scope="col">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <%
                                                    CategoriaDAO dao = new CategoriaDAO();
                                                    List<Categoria> list = dao.listarCategoria();
                                                    Iterator<Categoria> iter = list.iterator();
                                                    Categoria categ = null;
                                                    while (iter.hasNext()) {

                                                        categ = iter.next();

                                                %>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row"><%= categ.getId_categoria()%></th>
                                                        <td><%= categ.getCategoria()%></td>


                                                        <td>
                                                            <a class="btn btn-warning" href="Controlador?accion=getidCategoria&id=<%= categ.getId_categoria()%>" 
                                                               onclick="return confirm('¿Desea Editar los datos?');"
                                                               role="button">Editar</a>
                                                            <a class="btn btn-danger" 
                                                               href="Controlador?accion=deleteCategorias&id=<%= categ.getId_categoria()%>"  
                                                               onclick="return confirm('¿Está seguro de eliminar los datos?');"
                                                               role="button">Eliminar</a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>


                                        </div>
                                        </div>




                                    </form>    <br>                  
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
