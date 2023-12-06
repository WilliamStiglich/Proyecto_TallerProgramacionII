<%-- 
    Document   : index
    Created on : 28 ago. 2023, 21:31:44
    Author     : marce
--%>

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
        <title>Registrar Productos</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">

        <%
            CategoriaDAO daoc = new CategoriaDAO();
            List<Categoria> listc = daoc.cargaCategoria();
        %>
        <%
            MarcasDAO daomar = new MarcasDAO();
            List<Marcas> listmar = daomar.cargaMarcas();
        %>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="productos.jsp">Menu Registrar Productos</a>
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

                            <a class="nav-link" href="marcas.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Marcas
                            </a>
                            <a class="nav-link" href="categorias.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Categorias
                            </a>
                            <a class="nav-link" href="stock.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Inventario
                            </a>

                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <div class="sb-sidenav-footer">

                                </div>

                            </div>
                        </div>

                </nav>

            </div>



            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h5 class="mt-4">Ir a Inventario</h5>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="stock.jsp">Inventario</a></li>
                            <li class="breadcrumb-item active">Productos</li>
                        </ol>

                        <form action="Controlador?accion=VolverMenu" method="post">
                            <input type="hidden" name="accion" value="VolverMenu">
                            <input type="submit" value="Volver al Dashboard">
                        </form>
                        <!-- <a class="btn btn-success" href="add.jsp" role="button">Agregar Personas</a> -->
                        <br/>

                        <div class="card mb-4">

                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <img src="assets/img/paquete.png" style="margin-left: 370px;" />
                                <h1>Registrar Productos</h1>
                            </div>
                            <div class="card-body">
                                <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteSuccess");
                                    Boolean addSuccess = (Boolean) session.getAttribute("addSuccess");
                                    Boolean editSuccess = (Boolean) session.getAttribute("editSuccess");
                                    Boolean alertaMarcaCateg = (Boolean) session.getAttribute("alertaMarcaCateg");

                                    if (deleteSuccess != null && deleteSuccess) { %>
                                <div class="alert alert-danger" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("deleteSuccess");
                                } else if (addSuccess != null && addSuccess) { %>
                                <div class="alert alert-success" role="alert"> 
                                    Producto insertado con éxito!
                                </div>
                                <% session.removeAttribute("addSuccess");
                                } else if (editSuccess != null && editSuccess) { %>
                                <div class="alert alert-success" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("editSuccess");
                                } else if (alertaMarcaCateg != null && alertaMarcaCateg) { %>
                                <div class="alert alert-danger" role="alert">Debe Seleccionar una Categoria / Marca de la lista</div>
                                <% session.removeAttribute("alertaMarcaCateg");
                                    }%>

                                <table class="table table-hover">
                                    <form method="post" action="Controlador?accion=insertProd">
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput">Categoria:</label></p>
                                            <select class="form-select" arial-label="Default select example" id="cboListaCateg" name="cboListaCateg">     
                                                <option selected>Seleccione la Categoria:</option>
                                                <%
                                                    Iterator<Categoria> iterc = listc.iterator();
                                                    Categoria cate = null;
                                                    while (iterc.hasNext()) {
                                                        cate = iterc.next();
                                                %>
                                                <!--  <a class="nav-link" href=></a> -->
                                                <option value="<%=cate.getId_categoria()%>"><%= cate.getCategoria()%></option>
                                                <%}%>

                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput">Marcas:</label></p>
                                            <select class="form-select" arial-label="Default select example" id="cboListaMarca" name="cboListaMarca">
                                                <option selected>Seleccione la Marca:</option>

                                                <%
                                                    Iterator<Marcas> itermar = listmar.iterator();
                                                    Marcas mar = null;
                                                    while (itermar.hasNext()) {
                                                        mar = itermar.next();
                                                %>
                                                <!-- <a class="nav-link" href=></a> -->
                                                <option value="<%=mar.getId_marca()%>"><%= mar.getMarca()%></option>
                                                <%}%>

                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput">Producto:</label></p>
                                            <input type="text" class="form-control" id="txtProducto" name="txtProducto" placeholder="Ingrese el Producto">
                                        </div>
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput">Descripción:</label></p>
                                            <input type="text" class="form-control" id="txtDescrip" name="txtDescrip" placeholder="Ingrese la Descripción">
                                        </div>
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput2">Precio Unitario:</label></p>
                                            <input type="number" class="form-control" id="txtPrecioUnitario" name="txtPrecioUnitario" placeholder="Ingrese el Precio de Venta Unitario">
                                        </div>
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput2">Precio de Costo:</label></p>
                                            <input type="number" class="form-control" id="txtPrecioCosto" name="txtPrecioCosto" placeholder="Ingrese el Precio de Costo">
                                        </div>
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput2">Precio Mayorista:</label></p>
                                            <input type="number" class="form-control" id="txtPrecioMayorista" name="txtPrecioMayorista" placeholder="Ingrese el Precio Mayorista">
                                        </div>
                                        <div class="form-group">
                                            <p class="font-weight-bold"><label for="formGroupExampleInput2">Cantidad:</label></p>
                                            <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" placeholder="Ingrese la Cantidad">
                                        </div>

                                        <button type="submit" class="btn btn-primary">Registrar</button>

                                        <script>
                                            function limpiar() {

                                                txtProducto.value = "";
                                                txtDescrip.value = "";
                                                txtPrecioUnitario.value = "";
                                                txtPrecioCosto.value = "";
                                                txtPrecioMayorista.value = "";
                                                txtCantidad.value = "";
                                            }
                                        </script>

                                        <a href="#" class="btn btn-danger" style="margin-left: 15px;" onclick="limpiar();">Cancelar</a>             
                                        <!-- <a href="#" class="btn btn-danger" style="margin-left: 15px;">Cancelar</a> -->
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
