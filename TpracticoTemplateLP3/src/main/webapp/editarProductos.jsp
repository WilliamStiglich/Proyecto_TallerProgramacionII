
<%@page import="modelo.MarcasDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.CategoriaDAO"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Marcas"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Editar Productos</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#">Editar Productos</a>
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

            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Opciones</div>
                            <a class="nav-link" href="categorias.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Lista de Categorias
                            </a>
                            <a class="nav-link" href="marcas.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Lista de Marcas
                            </a>
                            <a class="nav-link" href="stock.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Inventario
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${usuario}
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Edición de Productos
                            </div>
                            <div class="card-body">

                                <form action="Controlador?accion=VolverMenu" method="post">
                                    <input type="hidden" name="accion" value="VolverMenu">
                                    <input type="submit" value="Volver al Dashboard">
                                </form>
                                <!-- <a class="btn btn-success" href="add.jsp" role="button">Agregar Personas</a> -->
                                <br/>
                                &nbsp;
                                <table class="table table-hover">

                                    <div class="container py-4">
                                        <h1>Editar Productos</h1>
                                        <%
                                            List<Productos> list = (ArrayList<Productos>) request.getAttribute("list");

                                            Iterator<Productos> iter = list.iterator();
                                            Productos prod = null;
                                            if (iter.hasNext()) {
                                                prod = iter.next();
                                        %>

                                        <form method="post" action="Controlador?accion=editProdu">
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Id de Producto:</label>
                                                <input type="text" class="form-control" id="txtIDProducto" name="txtIDProducto" maxlength="10" value="<%= prod.getId_producto()%>"readonly>
                                            </div>
                                            <hr>
                       
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Producto:</label>
                                                <input type="text" class="form-control" id="txtProducto" name="txtProducto" maxlength="200" value="<%= prod.getProducto()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Descripcion:</label>
                                                <input type="text" class="form-control" id="txtDescrip" name="txtDescrip" maxlength="200" value="<%= prod.getDescripcion()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Precio Unitario:</label>
                                                <input type="number" class="form-control" id="txtPrecioUnitario" name="txtPrecioUnitario" maxlength="100" value="<%= prod.getPrecioUn()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Precio de Costo:</label>
                                                <input type="number" class="form-control" id="txtPrecioCosto" name="txtPrecioCosto" maxlength="100" value="<%= prod.getCosto()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Precio Mayorista:</label>
                                                <input type="number" class="form-control" id="txtPrecioMayorista" name="txtPrecioMayorista" maxlength="100" value="<%= prod.getPrecioMay()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Cantidad:</label>
                                                <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" maxlength="100" value="<%= prod.getCantidad()%>">
                                            </div>
                                            <hr>
                                            <hr>

                                            <input type="submit" value="Enviar" name="btnEnviar" class="btn btn-primary" />

                                        </form>

                                        <%}%>
                                        <hr>
                                        <hr>

                                        <a href="stock.jsp"> Volver al Inventario</a>
                                    </div>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

}%>


