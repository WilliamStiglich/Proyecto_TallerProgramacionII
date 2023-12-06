<%-- 
    Document   : index
    Created on : 28 ago. 2023, 21:31:44
    Author     : marce
--%>

<%@page import="modelo.Ventas"%>
<%@page import="modelo.VentasDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.ProductosDAO"%>
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
        <title>Registrar Ventas</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">

        <%
            PersonaDAO daop = new PersonaDAO();
            List<Persona> listp = daop.cargaPersonas();
        %>
        <%
            ProductosDAO daoprod = new ProductosDAO();
            List<Productos> listprod = daoprod.cargaProductos();
        %>
        <%
            UsuarioDAO daouser = new UsuarioDAO();
            List<Usuario> listuser = daouser.cargaVendedor();
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
                            <div class="sb-sidenav-footer">
                                <div class="small">Cajero:</div>
                                ${usuario}
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <img src="assets/img/paquete.png" style="margin-left: 370px;" />
                                <h1>Registrar Ventas</h1>
                            </div>
                            <div class="card-body">
                                <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteSuccess");
                                    Boolean addSuccess = (Boolean) session.getAttribute("VentaSuccess");
                                    Boolean editSuccess = (Boolean) session.getAttribute("editSuccess");
                                    Boolean alertaMarcaCateg = (Boolean) session.getAttribute("alertaMarcaCateg");

                                    if (deleteSuccess != null && deleteSuccess) { %>
                                <div class="alert alert-danger" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("deleteSuccess");
                                } else if (addSuccess != null && addSuccess) { %>
                                <div class="alert alert-success" role="alert"> 
                                    Venta éxitosa!
                                </div>
                                <% session.removeAttribute("VentaSuccess");
                                } else if (editSuccess != null && editSuccess) { %>
                                <div class="alert alert-success" role="alert">Editado en forma exitosa!</div>
                                <% session.removeAttribute("editSuccess");
                                } else if (alertaMarcaCateg != null && alertaMarcaCateg) { %>
                                <div class="alert alert-danger" role="alert">Debe Seleccionar una Categoria / Marca de la lista</div>
                                <% session.removeAttribute("alertaMarcaCateg");
                                    }%>

                                <!-- PERSONALIZAR DESDE ACA -->
                                <div class="d-flex">
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <form action="Controlador?accion=InsertarVentas2" method="POST">
                                                <div class="card-body">
                                                    <div class="form-group">
                                                        <label>Datos del Cliente</label>
                                                    </div>
                                                    <div class="form-group d-flex">
                                                        <select class="form-select" aria-label="Default select example" id="cboListaCliente" name="cboListaCliente">
                                                            <option selected>Seleccione el Cliente</option>
                                                            <%
                                                                Iterator<Persona> iterp = listp.iterator();
                                                                Persona per = null;
                                                                while (iterp.hasNext()) {
                                                                    per = iterp.next();
                                                            %>
                                                            <!--  <a class="nav-link" href=></a> -->
                                                            <option value="<%=per.getId_persona()%>"><%= per.getPersona()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Datos del Producto</label>
                                                    </div>
                                                    <div class="form-group d-flex">
                                                        <select class="form-select" arial-label="Default select example" id="cboListaProductos" name="cboListaProductos">
                                                            <option selected>Seleccione el Producto:</option>

                                                            <%
                                                                Iterator<Productos> itermar = listprod.iterator();
                                                                Productos prod = null;
                                                                while (itermar.hasNext()) {
                                                                    prod = itermar.next();
                                                            %>
                                                            <!-- <a class="nav-link" href=></a> -->
                                                            <option value="<%=prod.getId_producto()%>"><%= prod.getProducto_venta()%></option>
                                                            <%}%>

                                                        </select>
                                                    </div>

                                                    <div class="form-group d-flex">
                                                        <div class="col-sm-6 d-flex">
                                                           
                                                            <input type="text" class="form-control" id="txtPrecioUnitario" name="txtPrecioUnitario" value="" placeholder="Precio Gs./0.00" readonly>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <input type="number" id="txtCant" name="txtCant" class="form-control">
                                                        </div>


                                                        <div class="col-sm-5">
                                                            <input type="text" id="txtStock" name="txtStock" class="form-control" placeholder="Stock">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex col-sm-5 ms-auto">
                                                    <label>NroSerie:</label>&nbsp;
                                                    <input type="text" name="nroSerie" class="form-control">
                                                </div>
                                                <table class="table table-hover">
                                                    <thead>
                                                   
                                                        <tr>

                                                            <th>Id Venta</th>
                                                            <th>Descripcion</th>
                                                            <th>Precio</th>
                                                            <th>Cantidad</th>
                                                            <th>SubTotal</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <th scope="row"></th>

                                                            <td></td>
                                                             <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
 
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="card-footer">
                                                <input type="submit" name="accion" value="Generar Venta" class="btn btn-success">
                                                <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- PIE DE PAGINA -->           





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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function () {

        $('#cboListaProductos').change(function () {

            var opcionSeleccionada = $(this).val();

            $.ajax({

                type: 'GET',
                url: 'Controlador?accion=ObtenerValorProducto',
                data: {opcion: opcionSeleccionada},
                dataType: 'text',
                success: function (data) {
                    var valores = data.split(",");

                    $('#txtPrecioUnitario').val(valores[0]);
                    $('#txtStock').val(valores[1]);
                },

                error: function () {
                    alert('No se pudieron cargar los valores correspondientes en los campos establecidos');
                }


            });
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
