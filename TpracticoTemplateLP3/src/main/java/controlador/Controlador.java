package controlador;

import cx.conexion;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Barrio;
import modelo.BarrioDAO;
import modelo.Cargo;
import modelo.CargoDAO;
import modelo.Categoria;
import modelo.CategoriaDAO;
import modelo.Ciudad;
import modelo.CiudadDAO;
import modelo.Compras;
import modelo.ComprasDAO;
import modelo.EmailSender;
import modelo.Marcas;
import modelo.MarcasDAO;
import modelo.Menu;
import modelo.MenuDAO;
import modelo.Nacionalidad;
import modelo.NacionalidadDAO;
import modelo.Paises;
import modelo.PaisesDAO;
import modelo.Persona;
import modelo.PersonaDAO;
import modelo.Productos;
import modelo.ProductosDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.Ventas;
import modelo.VentasDAO;

public class Controlador extends HttpServlet {

    List<Menu> list;
    String accion;
    Persona per = new Persona();
    PersonaDAO dao = new PersonaDAO();
    String usuario = "", pass = "";
    MenuDAO daom = new MenuDAO();
    Productos prod = new Productos();
    ProductosDAO daop = new ProductosDAO();
    Marcas marcas = new Marcas();
    MarcasDAO daomarca = new MarcasDAO();
    Categoria cate = new Categoria();
    CategoriaDAO daocate = new CategoriaDAO();
    Paises pai = new Paises();
    PaisesDAO daopais = new PaisesDAO();
    Nacionalidad nacio = new Nacionalidad();
    NacionalidadDAO daonacio = new NacionalidadDAO();
    Ciudad ciud = new Ciudad();
    CiudadDAO daociud = new CiudadDAO();
    Barrio bar = new Barrio();
    BarrioDAO daobar = new BarrioDAO();
    Cargo car = new Cargo();
    CargoDAO daocarg = new CargoDAO();
    Ventas vent = new Ventas();
    VentasDAO daov = new VentasDAO();
    public Object JasperRunManager;
    Usuario use = new Usuario();
    UsuarioDAO daous = new UsuarioDAO();
    Compras comp = new Compras();
    ComprasDAO daocomp = new ComprasDAO();
    Proveedor prove = new Proveedor();
    ProveedorDAO daoprove = new ProveedorDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession sesion = request.getSession();
            if (request.getParameter("accion") != null) {
                accion = request.getParameter("accion");
                usuario = request.getParameter("inputEmail");
                pass = request.getParameter("inputPassword");
            }
            switch (accion) {
                case "login":
                    list = daom.menu_dinamico(usuario, pass);
                    if (!list.isEmpty()) {
                        request.setAttribute("list", list);
                        sesion.setAttribute("usuario", usuario);
                        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    }
                    if (list.isEmpty()) {
                        request.setAttribute("list", list);
                        sesion.setAttribute("usuario", usuario);
                        request.setAttribute("mensajeError", "Credenciales inválidas. Inténtalo nuevamente.");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    /*if (rol.trim().equals("admin")) {
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("pass", rol);
                    response.sendRedirect("listar.jsp");
                }else if (rol.trim().equals("vendedor")) {
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("rol", rol);
                    response.sendRedirect("session.jsp");
                }*/
                    break;

                case "listar":
                    request.getRequestDispatcher("listar.jsp").forward(request, response);
                    break;

                case "add":
                    String ci = request.getParameter("txtcedula");
                    String nombre = request.getParameter("txtnombre");
                    String apellido = request.getParameter("txtapellido");
                    String direcc = request.getParameter("txtdirecc");
                    int id_ciudad1 = Integer.parseInt(request.getParameter("cboListaCiudad"));
                    int id_barrio1 = Integer.parseInt(request.getParameter("cboListaBarrio"));
                    int id_pais1 = Integer.parseInt(request.getParameter("cboListaPais"));
                    int id_nac1 = Integer.parseInt(request.getParameter("cboListaNac"));
                    per.setCedula(ci);
                    per.setNombre(nombre);
                    per.setApellido(apellido);
                    per.setDireccion(direcc);
                    per.setId_ciudad(id_ciudad1);
                    per.setId_barrio(id_barrio1);
                    per.setId_pais(id_pais1);
                    per.setId_nacionalidad(id_nac1);

                    // Validar si la cédula ya existe
                    if (dao.CedulaExiste(per)) {
                        // La cédula ya existe, muestra un mensaje de error o realiza la acción apropiada
                        //request.setAttribute("error", "La cédula ya existe en la base de datos");
                        request.setAttribute("CedulaExistente", true);
                        request.getRequestDispatcher("add.jsp").forward(request, response);
                    } else {
                        if (dao.add(per)) {
                            request.getSession().setAttribute("addSuccess", true);
                            request.setAttribute("list", list); // variable global
                            request.setAttribute("usuario", usuario);
                            request.getRequestDispatcher("listarClientes.jsp").forward(request, response);
                        }
                    }
                    break;

                case "delete":
                    int id_persona = Integer.parseInt(request.getParameter("id"));
                    dao.del(id_persona);
                    request.getSession().setAttribute("deleteSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("listarClientes.jsp").forward(request, response);
                    break;

                case "getid":
                    int id = Integer.parseInt(request.getParameter("id"));
                    List<Persona> list2 = dao.listar_id(id);
                    request.setAttribute("list", list2);
                    request.getRequestDispatcher("edit.jsp").forward(request, response);

                    break;

                case "edit":
                    int id_per = Integer.parseInt(request.getParameter("txtid"));
                    String cedula2 = request.getParameter("txtcedula");
                    String nombre2 = request.getParameter("txtnombre");
                    String apellido2 = request.getParameter("txtapellido");
                    String direcc1 = request.getParameter("txtdirecc");
                    int id_ciudad2 = Integer.parseInt(request.getParameter("cboListaCiudad"));
                    int id_barrio2 = Integer.parseInt(request.getParameter("cboListaBarrio"));
                    int id_pais2 = Integer.parseInt(request.getParameter("cboListaPais"));
                    int id_nacio2 = Integer.parseInt(request.getParameter("cboListaNac"));

                    per.setId_persona(id_per);
                    per.setCedula(cedula2);
                    per.setNombre(nombre2);
                    per.setApellido(apellido2);
                    per.setDireccion(direcc1);
                    per.setId_ciudad(id_ciudad2);
                    per.setId_barrio(id_barrio2);
                    per.setId_pais(id_pais2);
                    per.setId_nacionalidad(id_nacio2);

                    dao.edit(per);

                    request.getSession().setAttribute("editSuccess", true);
                    //request.getRequestDispatcher("listar.jsp").forward(request, response);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("NoESindex.jsp");
                    request.getRequestDispatcher("listarClientes.jsp").forward(request, response);
                    break;
                case "listarCategoria":
                    CategoriaDAO daoc = new CategoriaDAO();
                    List<Categoria> listc = daoc.cargaCategoria();
                    request.setAttribute("listc", listc);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;

                case "listarMarca":
                    MarcasDAO daomar = new MarcasDAO();
                    List<Marcas> listmar = daomar.cargaMarcas();
                    request.setAttribute("listmar", listmar);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;

                case "insertProd":

                    int id_cate = Integer.parseInt(request.getParameter("cboListaCateg"));
                    int id_marca = Integer.parseInt(request.getParameter("cboListaMarca"));
                    String producto = request.getParameter("txtProducto");
                    String descripcion = request.getParameter("txtDescrip");
                    int precioUn = Integer.parseInt(request.getParameter("txtPrecioUnitario"));
                    int costo = Integer.parseInt(request.getParameter("txtPrecioCosto"));
                    int precioMay = Integer.parseInt(request.getParameter("txtPrecioMayorista"));
                    int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));

                    prod.setProducto(producto);
                    prod.setDescripcion(descripcion);
                    prod.setId_categoria(id_cate);
                    prod.setId_marca(id_marca);
                    prod.setPrecioUn(precioUn);
                    prod.setCosto(costo);
                    prod.setPrecioMay(precioMay);
                    prod.setCantidad(cantidad);
                    daop.insertProd(prod);
                    request.getSession().setAttribute("addProdSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("stock.jsp").forward(request, response);
                    break;

                case "insertMarcas":
                    String mar = request.getParameter("txtMarca");
                    marcas.setMarca(mar);
                    daomarca.insertMarca(marcas);
                    request.getSession().setAttribute("addMarcaSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("marcas.jsp").forward(request, response);
                    break;

                case "insertCategoria":
                    String categ = request.getParameter("txtCategoria");
                    cate.setCategoria(categ);
                    daocate.insertCategoria(cate);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("categorias.jsp").forward(request, response);
                    break;

                case "VolverMenu":
                    request.setAttribute("list", list);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);

                    break;

                case "getidProd":
                    int idp = Integer.parseInt(request.getParameter("id"));
                    List<Productos> listget = daop.listarProd_id2(idp);
                    request.setAttribute("list", listget);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editarProductos_1.jsp").forward(request, response);
                    break;

                case "editProdu":
                    int id_prod = Integer.parseInt(request.getParameter("txtIDProducto"));
                    int Categ = Integer.parseInt(request.getParameter("cboListaCateg"));
                    int Marca = Integer.parseInt(request.getParameter("cboListaMarca"));

                    String produ = request.getParameter("txtProducto");
                    String descrip = request.getParameter("txtDescrip");
                    int PrecioUni = Integer.parseInt(request.getParameter("txtPrecioUnitario"));
                    int Costo = Integer.parseInt(request.getParameter("txtPrecioCosto"));
                    int PrecioMay = Integer.parseInt(request.getParameter("txtPrecioMayorista"));
                    int Cantidad = Integer.parseInt(request.getParameter("txtCantidad"));

                    prod.setId_producto(id_prod);
                    prod.setId_categoria(Categ);
                    prod.setId_marca(Marca);
                    prod.setProducto(produ);
                    prod.setDescripcion(descrip);
                    prod.setPrecioUn(PrecioUni);
                    prod.setCosto(Costo);
                    prod.setPrecioMay(PrecioMay);
                    prod.setCantidad(Cantidad);

                    daop.editProd2(prod);
                    request.getSession().setAttribute("editSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("NoESindex.jsp");
                    request.getRequestDispatcher("stock.jsp").forward(request, response);
                    break;

                case "deleteProd":
                    int id_producto = Integer.parseInt(request.getParameter("id"));
                    daop.deleteProd(id_producto);
                    request.getSession().setAttribute("deleteProdSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("stock.jsp").forward(request, response);
                    break;

                case "deleteMarcas":
                    int id_marcas = Integer.parseInt(request.getParameter("id"));
                    daomarca.deleteMarcas(id_marcas);
                    request.getSession().setAttribute("deleteMarcaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("marcas.jsp").forward(request, response);
                    break;

                case "deleteCategorias":
                    int id_categoria = Integer.parseInt(request.getParameter("id"));
                    daocate.deleteCategoria(id_categoria);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("categorias.jsp").forward(request, response);
                    break;

                case "getidMarca":
                    int id_m = Integer.parseInt(request.getParameter("id"));
                    List<Marcas> listmarc = daomarca.listarMarcas_id(id_m);
                    request.setAttribute("list", listmarc);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editMarcas.jsp").forward(request, response);
                    break;

                case "editMarcas":

                    int id_marc = Integer.parseInt(request.getParameter("txtIdmarca"));
                    String marc = request.getParameter("txtMarca");

                    marcas.setId_marca(id_marc);
                    marcas.setMarca(marc);
                    daomarca.editMarcas(marcas);
                    request.getSession().setAttribute("editMarcaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("marcas.jsp").forward(request, response);
                    break;

                case "getidCategoria":
                    int id_cat = Integer.parseInt(request.getParameter("id"));
                    List<Categoria> listcateg = daocate.listarCateg_id(id_cat);
                    request.setAttribute("list", listcateg);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editCategorias.jsp").forward(request, response);
                    break;

                case "editCategoria":

                    int id_catego = Integer.parseInt(request.getParameter("txtIdcateg"));
                    String catego = request.getParameter("txtCateg");

                    cate.setId_categoria(id_catego);
                    cate.setCategoria(catego);
                    daocate.editCategorias(cate);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("categorias.jsp").forward(request, response);
                    break;
                case "InsertarVentas":
                    VentasDAO ventasDAO = new VentasDAO();
                    int idPersona = Integer.parseInt(request.getParameter("cboListaCliente"));
                    int idUsuario = Integer.parseInt(request.getParameter("cboListaVendedores"));
                    double monto = Integer.parseInt(request.getParameter("txtTotalVenta"));
                    //int idVenta= 1;
                    int idProducto = Integer.parseInt(request.getParameter("cboListaProductos"));
                    double cantidad1 = Integer.parseInt(request.getParameter("txtCantidad"));
                    double precioVenta = Integer.parseInt(request.getParameter("txtPrecioUnitario"));

                    Ventas venta = new Ventas();
                    venta.setId_persona(idPersona);
                    venta.setId_usuario(idUsuario);
                    venta.setMonto(monto);

                    int cabeceraInsertada = ventasDAO.insertCabeceraVentas(venta);
                    venta.setId_venta(cabeceraInsertada);
                    venta.setId_producto(idProducto);
                    venta.setCantidad(cantidad1);
                    venta.setPrecio_venta(precioVenta);

                    if (cabeceraInsertada > 0) {
                        // Inserta el detalle de la venta
                        boolean detalleInsertado = ventasDAO.insertDetalleVentas(venta);

                        if (detalleInsertado) {
                            response.sendRedirect("ventas.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                    request.getSession().setAttribute("VentaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("ventas.jsp").forward(request, response);
                    break;

                case "InsertarCompras":
                    ComprasDAO compraDAO = new ComprasDAO();
                    int idProveedor = Integer.parseInt(request.getParameter("cboListaProveedor"));
                    int montoComp = Integer.parseInt(request.getParameter("txtPrecioCompraU"));
                    //int idVenta= 1;
                    int idProductoComp = Integer.parseInt(request.getParameter("cboListaProductos"));
                    int cantidadComp = Integer.parseInt(request.getParameter("txtCantidadCompra"));
                    int precioCompraTotal = Integer.parseInt(request.getParameter("txtPrecioCompraTotal"));

                    Compras compra = new Compras();
                    compra.setId_proveedor(idProveedor);
                    compra.setMonto(precioCompraTotal);

                    int cabeceraInsertadaComp = compraDAO.insertCabeceraCompras(compra);
                    compra.setId_compra(cabeceraInsertadaComp);
                    compra.setId_producto(idProductoComp);
                    compra.setCantidad(cantidadComp);
                    compra.setPrecio_compra(montoComp);

                    if (cabeceraInsertadaComp > 0) {
                        // Inserta el detalle de la compra
                        boolean detalleInsertado = compraDAO.insertDetalleCompras(compra);

                        if (detalleInsertado) {
                            response.sendRedirect("compras.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        response.sendRedirect("index.jsp");
                    }

                    request.getSession().setAttribute("CompraSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("compras.jsp").forward(request, response);
                    break;

                case "listarCargo":
                    CargoDAO daocar = new CargoDAO();
                    List<Cargo> listcar = daocar.cargaCargo();
                    request.setAttribute("listcar", listcar);
                    request.getRequestDispatcher("cargo.jsp").forward(request, response);
                    break;

                case "listarCiudad":
                    CiudadDAO daociu = new CiudadDAO();
                    List<Ciudad> listciu = daociu.cargaCiudad();
                    request.setAttribute("listciu", listciu);
                    request.getRequestDispatcher("ciudades.jsp").forward(request, response);
                    break;

                case "listarBarrio":
                    BarrioDAO daoba = new BarrioDAO();
                    List<Barrio> listba = daoba.cargaBarrio();
                    request.setAttribute("listba", listba);
                    request.getRequestDispatcher("barrios.jsp").forward(request, response);
                    break;

                case "listarNacionalidad":
                    NacionalidadDAO daonac = new NacionalidadDAO();
                    List<Nacionalidad> listnac = daonac.cargaNacionalidad();
                    request.setAttribute("listnac", listnac);
                    request.getRequestDispatcher("nacionalidad.jsp").forward(request, response);
                    break;

                case "listarPaises":
                    PaisesDAO daopa = new PaisesDAO();
                    List<Paises> listpa = daopa.cargaPais();
                    request.setAttribute("listpa", listpa);
                    request.getRequestDispatcher("paises.jsp").forward(request, response);
                    break;

                case "insertPais":
                    String pais = request.getParameter("txtPais");
                    pai.setPais(pais);
                    daopais.insertPais(pai);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("paises.jsp").forward(request, response);
                    break;

                case "deletePais":
                    int id_pais = Integer.parseInt(request.getParameter("id"));
                    daopais.deletePais(id_pais);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("paises.jsp").forward(request, response);
                    break;

                case "getid_Pais":
                    int id_pa = Integer.parseInt(request.getParameter("id"));
                    List<Paises> listp = daopais.listarPaises_id(id_pa);
                    request.setAttribute("list", listp);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editPaises.jsp").forward(request, response);
                    break;

                case "editPaises":

                    int id_p = Integer.parseInt(request.getParameter("txtIdcateg"));
                    String paisa = request.getParameter("txtCateg");

                    pai.setId_pais(id_p);
                    pai.setPais(paisa);
                    daopais.editPais(pai);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("paises.jsp").forward(request, response);
                    break;

                case "insertNac":
                    String nac = request.getParameter("txtNac");
                    nacio.setNacionalidad(nac);
                    daonacio.insertNacionalidad(nacio);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("nacionalidad.jsp").forward(request, response);
                    break;

                case "deleteNac":
                    int id_nac = Integer.parseInt(request.getParameter("id"));
                    daonacio.deleteNacionalidad(id_nac);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("nacionalidad.jsp").forward(request, response);
                    break;

                case "getid_Nac":
                    int id_nacion = Integer.parseInt(request.getParameter("id"));
                    List<Nacionalidad> listn = daonacio.listarNacionalidad_id(id_nacion);
                    request.setAttribute("list", listn);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editNacionalidad.jsp").forward(request, response);
                    break;

                case "editNacion":

                    int id_nacc = Integer.parseInt(request.getParameter("txt_Id_Nac"));
                    String nacion = request.getParameter("txtNacion");

                    nacio.setId_nacionalidad(id_nacc);
                    nacio.setNacionalidad(nacion);
                    daonacio.editNacionalidad(nacio);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("nacionalidad.jsp").forward(request, response);
                    break;

                case "insertCiudad":
                    String ciu = request.getParameter("txtCiudad");
                    ciud.setCiudad(ciu);
                    daociud.insertCiudad(ciud);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("ciudades.jsp").forward(request, response);
                    break;

                case "deleteCiudad":
                    int id_ciu = Integer.parseInt(request.getParameter("id"));
                    daociud.deleteCiudad(id_ciu);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("ciudades.jsp").forward(request, response);
                    break;

                case "getid_Ciudad":
                    int id_ciud = Integer.parseInt(request.getParameter("id"));
                    List<Ciudad> listci = daociud.listarCiudad_id(id_ciud);
                    request.setAttribute("list", listci);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editCiudad.jsp").forward(request, response);
                    break;

                case "editCiudad":

                    int id_ciudad = Integer.parseInt(request.getParameter("txt_Id_Ciudad"));
                    String ciudad = request.getParameter("txtCiudad");

                    ciud.setId_ciudad(id_ciudad);
                    ciud.setCiudad(ciudad);
                    daociud.editCiudad(ciud);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("ciudades.jsp").forward(request, response);
                    break;

                case "insertBarrio":
                    String ba = request.getParameter("txtBarrio");
                    bar.setBarrio(ba);
                    daobar.insertBarrio(bar);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("barrios.jsp").forward(request, response);
                    break;

                case "deleteBarrio":
                    int id_ba = Integer.parseInt(request.getParameter("id"));
                    daobar.deleteBarrio(id_ba);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("barrios.jsp").forward(request, response);
                    break;

                case "getid_Barrio":
                    int id_bar = Integer.parseInt(request.getParameter("id"));
                    List<Barrio> listbar = daobar.listarBarrio_id(id_bar);
                    request.setAttribute("list", listbar);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editBarrios.jsp").forward(request, response);
                    break;

                case "editBarrio":

                    int id_barr = Integer.parseInt(request.getParameter("txt_Id_Barrio"));
                    String barr = request.getParameter("txtBarrio");

                    bar.setId_barrio(id_barr);
                    bar.setBarrio(barr);
                    daobar.editBarrio(bar);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("barrios.jsp").forward(request, response);
                    break;

                case "insertCargo":
                    String ca = request.getParameter("txtCargo");
                    car.setRol(ca);
                    daocarg.insertCargo(car);
                    request.getSession().setAttribute("addCategSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("cargo.jsp").forward(request, response);
                    break;

                case "deleteCargo":
                    int id_ca = Integer.parseInt(request.getParameter("id"));
                    daocarg.deleteCargo(id_ca);
                    request.getSession().setAttribute("deleteCategoriaSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("cargo.jsp").forward(request, response);
                    break;

                case "getid_PuestoTrabajo":
                    int id_pto = Integer.parseInt(request.getParameter("id"));
                    List<Cargo> listcarg = daocarg.listarCargo_id(id_pto);
                    request.setAttribute("list", listcarg);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editPuestoTrabajo.jsp").forward(request, response);
                    break;

                case "editPuestoTrabajo":
                    int id_pto1 = Integer.parseInt(request.getParameter("txt_Id_PtoTrbajo"));
                    String puesto = request.getParameter("txtPtoTrabajo");

                    car.setId_rol(id_pto1);
                    car.setRol(puesto);
                    daocarg.editCargo(car);
                    request.getSession().setAttribute("editCategSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    //response.sendRedirect("edit_Marcas.jsp");
                    request.getRequestDispatcher("cargo.jsp").forward(request, response);
                    break;

                case "AnularVenta":
                    int id_vta = Integer.parseInt(request.getParameter("id"));
                    daov.AnularVenta(id_vta);
                    request.getSession().setAttribute("deleteProdSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("historico_ventas.jsp").forward(request, response);
                    break;

                case "AnularCompra":
                    int id_comp = Integer.parseInt(request.getParameter("id"));
                    daocomp.AnularCompra(id_comp);
                    request.getSession().setAttribute("deleteProdSuccess", true);
                    request.setAttribute("list", list); //variable global
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("historico_compras.jsp").forward(request, response);
                    break;

                case "getStock":
                    int stock = Integer.parseInt(request.getParameter("cboListaProductos"));
                    List<Productos> lists = daop.ObtenerStock(stock);
                    request.setAttribute("list", lists);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("ventas2.jsp").forward(request, response);
                    break;

                case "imprimirVenta":
                    Connection con;
                    conexion cx = new conexion();
                    con = cx.getConexion();

                    int idRegistro = Integer.parseInt(request.getParameter("id"));

                    File reporte = new File(getServletContext().getRealPath("WEB-INF/reportes/report4.jasper"));

                    Map<String, Object> parametros = new HashMap<String, Object>();
                    parametros.put("id", idRegistro);
                    try {
                        // Use JasperRunManager as a class to run the report
                        byte[] bytes = net.sf.jasperreports.engine.JasperRunManager.runReportToPdf(reporte.getPath(), parametros, con);

                        response.setHeader("Content-Disposition", "inline; filename=report1.pdf");
                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream outS = response.getOutputStream();
                        outS.write(bytes, 0, bytes.length);
                        outS.flush();
                        outS.close();
                    } catch (Exception e) {
                        System.out.println("EL ERROR ES: " + e.toString());
                    }
                    String recipientEmail = request.getParameter("inputEmail");
                    String pdfFilePath = getServletContext().getRealPath("C:\\Users\\DELL\\OneDrive\\Documentos\\NetBeansProjects\\TpracticoTemplateLP3\\src\\main\\webapp\\WEB-INF\\reportes\\report4.jrxml");

                    break;

                case "imprimirCompra":
                    Connection con2;
                    conexion cx2 = new conexion();
                    con2 = cx2.getConexion();

                    int idRegistro2 = Integer.parseInt(request.getParameter("id"));

                    File reporte2 = new File(getServletContext().getRealPath("WEB-INF/reportes/report5.jasper"));

                    Map<String, Object> parametros2 = new HashMap<String, Object>();
                    parametros2.put("id", idRegistro2);
                    try {
                        // Use JasperRunManager as a class to run the report
                        byte[] bytes = net.sf.jasperreports.engine.JasperRunManager.runReportToPdf(reporte2.getPath(), parametros2, con2);

                        response.setHeader("Content-Disposition", "inline; filename=report1.pdf");
                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream outS = response.getOutputStream();
                        outS.write(bytes, 0, bytes.length);
                        outS.flush();
                        outS.close();
                    } catch (Exception e) {
                        System.out.println("EL ERROR ES: " + e.toString());
                    }

                    break;

                case "ObtenerValorProducto":

                    double preciopro = 0.0;
                    int stock_actual = 0;
                    int idpr = Integer.parseInt(request.getParameter("opcion"));

                    List<Productos> producto_elegido = daop.listarProd_id2(idpr);
                    Iterator<Productos> iterp = producto_elegido.iterator();
                    Productos product;
                    if (iterp.hasNext()) {
                        product = iterp.next();
                        preciopro = product.getPrecioUn();
                        stock_actual = product.getCantidad();

                    }

                    String reponseText = preciopro + "," + stock_actual;

                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");

                    response.getWriter().write(reponseText);

                    break;

                case "addUsu":
                    int id_persona1 = Integer.parseInt(request.getParameter("cboListaPersona"));
                    int id_cargo = Integer.parseInt(request.getParameter("cboListaRol"));
                    String usuario = request.getParameter("inputEmail");
                    String clave1 = request.getParameter("inputPassword");
                    String clave2 = request.getParameter("inputPasswordConfirm");

                    use.setId_pers(id_persona1);
                    use.setId_rol(id_cargo);
                    use.setUsuario(usuario);
                    use.setClave(clave1); // Solo establecemos la clave en el objeto user si las contraseñas coinciden

                    if (daous.usuarioExiste(use)) {
                        // El usuario ya existe, muestra un mensaje de error
                        request.setAttribute("usuarioExistente", true);
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    } else {
                        if (clave1.equals(clave2)) {
                            daous.addUser(use);
                            request.getSession().setAttribute("creadoSuccess", true);
                            response.sendRedirect("index.jsp");
                        } else {
                            request.setAttribute("claveError", true);
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    }
                    break;

                case "getidUser":
                    int id_u = Integer.parseInt(request.getParameter("id"));
                    List<Usuario> listu = daous.listar_idUSU(id_u);
                    request.setAttribute("list", listu);
                    request.getRequestDispatcher("editUser.jsp").forward(request, response);

                    break;

                case "editUser":
                    int id_us = Integer.parseInt(request.getParameter("inputIdUsu"));
                    String uses = request.getParameter("inputEmail");
                    String clave = request.getParameter("inputPassword");
                    int id_rol = Integer.parseInt(request.getParameter("cboListaPtoTrabajo"));
                    use.setId_usuario(id_us);
                    use.setUsuario(uses);
                    use.setClave(clave);
                    use.setId_rol(id_rol);
                    daous.editUser(use);
                    request.getSession().setAttribute("editSuccess", true);
                    request.setAttribute("list", list);
                    //request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("listarUser.jsp").forward(request, response);

                    break;

                case "insertProveedor":
                    String prov = request.getParameter("txtProveedor");
                    String ruc = request.getParameter("txtRuc");
                    prove.setProveedor(prov);
                    prove.setRuc(ruc);
                    daoprove.insertProveedor(prove);
                    request.getSession().setAttribute("addSuccess", true);
                    //response.sendRedirect("NoESindex.jsp");
                    request.setAttribute("list", list); //variable global
                    //request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("proveedores.jsp").forward(request, response);
                    break;

                case "getidProveedor":
                    int id_pr = Integer.parseInt(request.getParameter("id"));
                    List<Proveedor> listpr = daoprove.listarProveedor_id(id_pr);
                    request.setAttribute("list", listpr);
                    request.getRequestDispatcher("editProveedor.jsp").forward(request, response);

                    break;

                case "editProveedor":
                    int id_prov = Integer.parseInt(request.getParameter("txt_Id_prove"));
                    String prov1 = request.getParameter("txtProvee");
                    String ruc1 = request.getParameter("txtRuc");

                    prove.setId_proveedor(id_prov);
                    prove.setProveedor(prov1);
                    prove.setRuc(ruc1);
                    daoprove.editProveedor(prove);
                    request.getSession().setAttribute("editSuccess", true);
                    request.setAttribute("list", list); //variable global
                    //request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("listarProveedor.jsp").forward(request, response);
                    break;

                case "deleteProveedor":
                    int id_prv = Integer.parseInt(request.getParameter("id"));
                    daoprove.deleteProveedor(id_prv);
                    request.getSession().setAttribute("deleteSuccess", true);
                    request.setAttribute("list", list); //variable global
                    //request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("listarProveedor.jsp").forward(request, response);
                    break;
                case "BuscarCliente":
                    String ci2 = request.getParameter("codigocliente");
                   
                   per.setCedula(ci2);
                   Persona cl=dao.buscar(ci2);
                        request.setAttribute("nombrescliente",cl);
                        break;


                default:
                    throw new AssertionError();
            }

        } catch (Exception e) {
            System.out.println("el error en CONTROLADOR DTO es: " + e.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
