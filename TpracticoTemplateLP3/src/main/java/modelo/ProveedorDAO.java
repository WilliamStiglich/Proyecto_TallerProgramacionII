/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.proveedor;
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
public class ProveedorDAO implements proveedor {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List cargaProveedor() {
        ArrayList<Proveedor> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL sp_CargaProveedor()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor prove = new Proveedor();
                prove.setId_proveedor(rs.getInt("id_proveedor"));
                prove.setProveedores(rs.getString("proveedores"));
                list.add(prove);
            }
        } catch (SQLException e) {
            System.out.println("error en CargaProveedor: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean insertProveedor(Proveedor prove) {
     boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarProveedor`(?,?)");
            cs.setString(1, prove.getProveedor());
            cs.setString(2, prove.getRuc());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertProveedores es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean deleteProveedor(int id) {
      boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarProveedor`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteProveedor es:" + e.toString());
        }
        return ok;
    
    }

    @Override
    public boolean editProveedor(Proveedor prove) {
 boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarProveedor`(?,?,?) ");
            cs.setInt(1, prove.getId_proveedor());
            cs.setString(2, prove.getProveedor());
             cs.setString(3,prove.getRuc());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en EditProveedor es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarProveedor_id(int id) {
      ArrayList<Proveedor> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarProveedor_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Proveedor prove = new Proveedor();
                prove.setId_proveedor(rs.getInt("id_proveedor"));
                prove.setProveedor(rs.getString("proveedor"));
                prove.setRuc(rs.getString("ruc"));
                list.add(prove);
            }

        } catch (Exception e) {
            System.out.println("error en ListarCiudad_id: " + e.toString());
        }
        return list;
    
    }

    @Override
    public List listaDeProveedores() {
     ArrayList<Proveedor> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL sp_ListaProveedor()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor prov = new Proveedor();
                prov.setId_proveedor(rs.getInt("id_proveedor"));
                prov.setProveedor(rs.getString("proveedor"));
                prov.setRuc(rs.getString("ruc"));
                list.add(prov);
            }
        } catch (SQLException e) {
            System.out.println("error en Lista de Proveedores es: " + e.toString());
        }
        return list;
    
    }

    

}
