/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author DELL
 */
public class crearUsuDTO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion");
            Usuario user = new Usuario();
            UsuarioDAO dao = new UsuarioDAO();
            switch (accion) {
                case "addUsu":
                    String cedula = request.getParameter("inputCedula");
                    String nombre = request.getParameter("inputFirstName");
                    String apellido = request.getParameter("inputLastName");
                    String usuario = request.getParameter("inputEmail");
                    String clave1 = request.getParameter("inputPassword");
                    String clave2 = request.getParameter("inputPasswordConfirm");

                    user.setCedula(cedula);
                    user.setNombre(nombre);
                    user.setApellido(apellido);
                    user.setUsuario(usuario);
                    user.setClave(clave1); // Solo establecemos la clave en el objeto user si las contraseñas coinciden

                    if (dao.usuarioExiste(user)) {
                        // El usuario ya existe, muestra un mensaje de error
                        request.setAttribute("usuarioExistente", true);
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    } else {
                        if (clave1.equals(clave2)) {
                            dao.addUser(user);
                            request.getSession().setAttribute("creadoSuccess", true);
                            response.sendRedirect("index.jsp");
                        } else {
                            request.setAttribute("claveError", true);
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    }
                    break;

                case "getidUSU":
                    int id = Integer.parseInt(request.getParameter("id"));
                    List<Usuario> list = dao.listar_idUSU(id);
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("resetPin.jsp").forward(request, response);

                    break;

                case "reset":
                    int id_usu = Integer.parseInt(request.getParameter("txtid"));
                    String clave = request.getParameter("inputPassword");

                    user.setId_usuario(id_usu);
                    user.setClave(clave);
                    dao.editUser(user);
                    request.getSession().setAttribute("editSuccess", true);
                    //request.getRequestDispatcher("listar.jsp").forward(request, response);
                    response.sendRedirect("index.jsp");
                    break;
                default:
                    throw new AssertionError();

            }

        } catch (Exception e) {
            System.out.println("El error al crear USUARIO es: " + e.toString());
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
