/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.compras;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ComprasDAO implements compras {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public int insertCabeceraCompras(Compras comp) {
        int ok = 0;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarCaberceraCompras`(?,?,?)");
            cs.setInt(1, comp.getId_proveedor());
            cs.setInt(2, comp.getMonto());
            cs.registerOutParameter(3, Types.INTEGER);
            cs.execute();
            ok = cs.getInt(3);
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertCabeceraCompra es:" + e.toString());
        }
        return ok;

    }

    @Override
    public boolean insertDetalleCompras(Compras comp) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarDetalle_Compras`(?,?,?,?)");
            cs.setInt(1, comp.getId_compra());
            cs.setInt(2, comp.getId_producto());
            cs.setInt(3, comp.getCantidad());
            cs.setInt(4, comp.getPrecio_compra());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertDetalleCompra es:" + e.toString());
        }
        return ok;

    }

    @Override
    public List listarCompras() {
        ArrayList<Compras> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_HistorialCompras`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Compras comp = new Compras();
                comp.setId_compra(rs.getInt("id_compra"));
                comp.setProveedor(rs.getString("proveed"));
                comp.setMonto(rs.getInt("monto"));
                comp.setFecha_compra(rs.getString("fecha_compra"));
                list.add(comp);
            }

        } catch (Exception e) {
            System.out.println("error en ListarVenta: " + e.toString());
        }

        return list;
    }

    @Override
    public boolean AnularCompra(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_AnularCompra`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            //cs.close();
        } catch (Exception e) {
            System.out.println("el error en AnularCompras es:" + e.toString());
        }
        return ok;

    }

}
