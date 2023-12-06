<%-- 
    Document   : index
    Created on : 28 ago. 2023, 21:31:44
    Author     : marce
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="modelo.Ventas"%>
<%@page import="modelo.VentasDAO"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.ProductosDAO"%>
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
        <title>Inventario</title>
        <link href="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="C:\Users\DELL\OneDrive\Escritorio\pruebaBDTemplate" crossorigin="anonymous"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#">Tabla de Inventario</a>
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
                            <a class="nav-link" href="productos.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Registrar Productos
                            </a>      

                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Historico de Ventas</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="stock.jsp">Inventario</a></li>
                            <li class="breadcrumb-item active">Inventario</li>
                        </ol>
                        <form action="Controlador?accion=VolverMenu" method="post">
                            <input type="hidden" name="accion" value="VolverMenu">
                            <input type="submit" value="Volver al Dashboard">
                        </form>
                        <hr>
                        
                        <hr>
                        <div class="delete-container">
                            <% Boolean deleteSuccess = (Boolean) session.getAttribute("deleteProdSuccess");
                                Boolean addSuccess = (Boolean) session.getAttribute("addSuccess");
                                Boolean editSuccess = (Boolean) session.getAttribute("editSuccess");
                                Boolean addProdSuccess = (Boolean) session.getAttribute("addProdSuccess");

                                if (deleteSuccess != null && deleteSuccess) { %>
                            <div class="alert alert-success" role="alert">Venta cancelada</div>
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
                                        <th scope="col">ID Venta</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Monto Total Venta</th>
                                        <th scope="col">Fecha de Venta</th>
                                        <th scope="col">Vendedor</th>
                                        <th scope="col">Accion</th>  
                                    </tr>
                                </thead>
                                <%
                                    VentasDAO dao = new VentasDAO();
                                    List<Ventas> list = dao.listarVentas();
                                    Iterator<Ventas> iterv = list.iterator();
                                    Ventas venta = null;
                                    while (iterv.hasNext()) {

                                        venta = iterv.next();

                                %>
                                <tbody>
                                    <tr>
                                        <th scope="row"><%= venta.getId_venta()%></th>
                                        <td><%= venta.getCliente()%></td>
                                        <td><%= venta.getMonto()%></td>
                                        <td><%= venta.getFecha_venta()%></td>
                                        <td><%= venta.getUsuario()%></td>
                                        <td>

                                            <a class="btn btn-danger" 
                                               href="Controlador?accion=AnularVenta&id=<%= venta.getId_venta()%>" 
                                               onclick="return confirm('¿Desea Cancelar la Venta?');"
                                               role="button">Anular</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-success" 
                                               target="_blank"
                                               href="Controlador?accion=imprimirVenta&id=<%= venta.getId_venta()%>" 
                                               onclick="return confirm('¿Desea Imprimir?');"
                                               role="button">Imprimir</a>
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
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
