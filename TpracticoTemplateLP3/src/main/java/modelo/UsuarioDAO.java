/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.logueo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class UsuarioDAO implements logueo {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public ResultSet login(Usuario user) {

        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL sp_login (?,?)");
            cs.setString(1, user.getUsuario());
            cs.setString(2, user.getClave());
            rs = cs.executeQuery();

        } catch (SQLException e) {
            System.out.println("el error en Usuario DAO es" + e.toString());
        }
        return rs;
    }

    @Override
    public boolean addUser(Usuario user) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_CrearUsuarioPersona` (?,?,?,?)");
            cs.setInt(1, user.getId_pers());
            cs.setString(2, user.getUsuario());
            cs.setString(3, user.getClave());
            cs.setInt(4, user.getId_rol());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en CrearUser es:" + e.toString());
        }
        return ok;
    }

    public boolean usuarioExiste(Usuario user) {
        boolean existe = false;
        ResultSet rs = null;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_UsuarioYaExiste` (?)");
            cs.setString(1, user.getUsuario());
            //ResultSet rs = cs.executeQuery();
            rs = cs.executeQuery();
            //cs.close();
            if (rs.next()) {
                // Si el ResultSet contiene al menos un resultado, significa que el usuario ya existe
                existe = true;
            }
            rs.close();
            cs.close();
        } catch (Exception e) {
            System.out.println("El error en usuarioExiste es: " + e.toString());
        } finally {
            // Asegúrate de cerrar la conexión aquí si es necesario
            // Cerrar recursos (ResultSet, Statement, Connection) es importante para evitar fugas de recursos.
        }
        return existe;
    }

    @Override
    public List listar_idUSU(int id) {

        ArrayList<Usuario> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarUser_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Usuario us = new Usuario();
                us.setId_usuario(rs.getInt("id_usuario"));
                us.setUsuario(rs.getString("usuario"));
                us.setClave(rs.getString("clave"));
                list.add(us);
            }

        } catch (Exception e) {
            System.out.println("error en Listar_idUSU: " + e.toString());
        }

        return list;
    }

    @Override
    public boolean editUser(Usuario user) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarUsuarios`(?,?,?,?) ");
            cs.setInt(1, user.getId_usuario());
            cs.setString(2, user.getUsuario());
            cs.setString(3, user.getClave());
            cs.setInt(4, user.getId_rol());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en EditarUser es:" + e.toString());
        }
        return ok;
    }

    @Override
    public ResultSet login2(Usuario user) {

        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_login2`(?,?)");
            cs.setString(1, user.getUsuario());
            cs.setString(2, user.getClave());
            rs = cs.executeQuery();
        } catch (SQLException e) {
            System.out.println("error log: " + e.toString());
        }
        return rs;
    }

    public List listarUsu() {
        ArrayList<Usuario> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarUser`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario user1 = new Usuario();
                user1.setId_usuario(rs.getInt("id_usuario"));
                user1.setNombre(rs.getString("Nombre"));
                user1.setUsuario(rs.getString("usuario"));
                user1.setRol(rs.getString("rol"));
                list.add(user1);
            }

        } catch (Exception e) {
            System.out.println("error en Listar: " + e.toString());
        }

        return list;
    }

    public List cargaVendedor() {
        ArrayList<Usuario> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaUsuarioVendedor`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setId_usuario(rs.getInt("id_usuario"));
                user.setUsuario(rs.getString("usuario"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("error en CargaUsuario: " + e.toString());
        }
        return list;

    }

}
