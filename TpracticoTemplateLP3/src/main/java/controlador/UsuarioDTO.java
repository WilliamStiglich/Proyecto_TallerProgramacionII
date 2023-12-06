/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.MenuDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author DELL
 */
public class UsuarioDTO extends HttpServlet {

    List<Usuario> list = new ArrayList<>();
      String usuario = "", pass = "";
    MenuDAO daom = new MenuDAO();

    //ResultSet rs;
    //Usuario user = new Usuario();
    //UsuarioDAO dao = new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String accion = request.getParameter("accion");
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = new Usuario();
            ResultSet rs;

            switch (accion) {
                case "login":
                    String usu = request.getParameter("inputEmail").trim();
                    String pass = request.getParameter("inputPassword").trim();
                    usuario.setUsuario(usu);
                    usuario.setClave(pass);
                    rs = dao.login2(usuario);
                    if (rs.next()) {
                        if (rs.getInt("login") == 1) {
                            response.sendRedirect("NoESindex.jsp");
                        } else {
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    } else {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    break;

                case "getidUser":
                    int id = Integer.parseInt(request.getParameter("id"));
                    List<Usuario> list = dao.listar_idUSU(id);
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("editUser.jsp").forward(request, response);

                    break;

                case "editUser":
                    int id_user = Integer.parseInt(request.getParameter("inputIdUsu"));
                    String user = request.getParameter("inputEmail");
                    String clave = request.getParameter("inputPassword");

                    usuario.setId_usuario(id_user);
                    usuario.setUsuario(user);
                    usuario.setClave(clave);

                    dao.editUser(usuario);

                    request.getSession().setAttribute("editSuccess", true);
                    //request.setAttribute("list", list);
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("NoESindex.jsp").forward(request, response);

                    break;

                default:
                    response.sendRedirect("index.jsp");
                //throw new AssertionError();
            }
        } catch (SQLException ex) {
            System.out.println("error dto: " + ex.toString());
        }

        /*String resultado;
        try {
            String accion = request.getParameter("accion");
            if (accion.equals("Login")) {
                String usuario = request.getParameter("inputEmail");
                String passw = request.getParameter("inputPassword");
                user.setUsuario(usuario);
                user.setClave(passw);
                boolean loginValido = false;
                rs = dao.login(user);

                if (rs.next()) {
                    resultado = rs.getString("usuario");
                    loginValido = true;
                    if (resultado.equals("1")) {
                        request.getSession().setAttribute("usuario", usuario); // para dar bienvenida
                        //request.getRequestDispatcher("menu.jsp").forward(request, response);
                        response.sendRedirect("NoESindex.jsp");
                    } else {
                        //request.setAttribute("mensajeError", "Credenciales inválidas. Inténtalo nuevamente.");
                        //request.getRequestDispatcher("index.jsp").forward(request, response);
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    //response.sendRedirect("index.jsp");
                    request.setAttribute("mensajeError","mensajeError");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("index.jsp");
            }

        } catch (SQLException ex) {
            System.out.println("El error LOGIN es: " + ex.toString());
        }*/
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
