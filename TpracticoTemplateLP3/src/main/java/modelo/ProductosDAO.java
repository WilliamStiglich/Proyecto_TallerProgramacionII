/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.productos;
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
public class ProductosDAO implements productos {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public boolean insertProd(Productos prod) {

        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarProductos`(?,?,?,?,?,?,?,?)");
            cs.setString(1, prod.getProducto());
            cs.setString(2, prod.getDescripcion());
            cs.setInt(3, prod.getId_categoria());
            cs.setInt(4, prod.getId_marca());
            cs.setInt(5, prod.getPrecioUn());
            cs.setInt(6, prod.getCosto());
            cs.setInt(7, prod.getPrecioMay());
            cs.setInt(8, prod.getCantidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertProd es:" + e.toString());
        }
        return ok;

    }

    @Override
    public List listarProd() {

        ArrayList<Productos> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarProductos`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos prod = new Productos();
                prod.setId_producto(rs.getInt("id_producto"));
                prod.setCategoria(rs.getString("categoria"));
                prod.setProducto(rs.getString("producto"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setMarca(rs.getString("marca"));
                prod.setPrecioUn(rs.getInt("precio"));
                prod.setCosto(rs.getInt("costo"));
                prod.setPrecioMay(rs.getInt("precio_mayoreo"));
                prod.setCantidad(rs.getInt("stock"));
                list.add(prod);
            }

        } catch (Exception e) {
            System.out.println("error en Listar: " + e.toString());
        }

        return list;
    }

    @Override
    public List listarProd_id(int id) {
        ArrayList<Productos> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarProductos2_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Productos prod = new Productos();

                prod.setId_producto(rs.getInt("id_producto"));
                prod.setProducto(rs.getString("producto"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setPrecioUn(rs.getInt("precio"));
                prod.setCosto(rs.getInt("costo"));
                prod.setPrecioMay(rs.getInt("precio_mayoreo"));
                prod.setCantidad(rs.getInt("stock"));

                list.add(prod);
            }

        } catch (Exception e) {
            System.out.println("error en Listar_id de Producto: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean editProd(Productos prod) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_editarProductos`(?,?,?,?,?,?,?)");
            cs.setInt(1, prod.getId_producto());
            cs.setString(2, prod.getProducto());
            cs.setString(3, prod.getDescripcion());
            cs.setInt(4, prod.getPrecioUn());
            cs.setInt(5, prod.getCosto());
            cs.setInt(6, prod.getPrecioMay());
            cs.setInt(7, prod.getCantidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;

    }

    @Override
    public boolean deleteProd(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarProducto`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteProd es:" + e.toString());
        }
        return ok;

    }

    @Override
    public List listarProd_id2(int id) {
        ArrayList<Productos> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_listarProd_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Productos prod = new Productos();
                prod.setId_producto(rs.getInt("id_producto"));
                prod.setProducto(rs.getString("producto"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setId_categoria(rs.getInt("id_categoria"));
                prod.setId_marca(rs.getInt("id_marca"));
                prod.setPrecioUn(rs.getInt("precio"));
                prod.setCosto(rs.getInt("costo"));
                prod.setPrecioMay(rs.getInt("precio_mayoreo"));
                prod.setCantidad(rs.getInt("stock"));

                list.add(prod);
            }

        } catch (Exception e) {
            System.out.println("error en Listar_id de Producto: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean editProd2(Productos prod) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarProd2`(?,?,?,?,?,?,?,?,?)");
 
            cs.setInt(1, prod.getId_producto());
            cs.setString(2, prod.getProducto());
            cs.setString(3, prod.getDescripcion());
            cs.setInt(4, prod.getId_categoria());
            cs.setInt(5, prod.getId_marca());
            cs.setInt(6, prod.getPrecioUn());
            cs.setInt(7, prod.getCosto());
            cs.setInt(8, prod.getPrecioMay());
            cs.setInt(9, prod.getCantidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en EditarProd2DAO es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List cargaProductos() {
    ArrayList<Productos> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL sp_cargaProductos()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos prod = new Productos();
                prod.setId_producto(rs.getInt("id_producto"));
                prod.setProducto_venta(rs.getString("producto_venta"));
                list.add(prod);
            }
        } catch (SQLException e) {
            System.out.println("error en CargaProducto: " + e.toString());
        }
        return list;
    
    }
    
    
     public List ObtenerStock(int id) {
        ArrayList<Productos> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ObtenerStock`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Productos prod = new Productos();
                prod.setStock(rs.getInt("stock"));
                list.add(prod);
            }

        } catch (Exception e) {
            System.out.println("error en obtenerStock de Producto: " + e.toString());
        }
        return list;

    }

    
}
