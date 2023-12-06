/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.ventas;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class VentasDAO implements ventas {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public int insertCabeceraVentas(Ventas vent) {
        int ok = 0;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarCabeceraVentas`(?,?,?,?)");
            cs.setInt(1, vent.getId_persona());
            cs.setInt(2, vent.getId_usuario());
            cs.setDouble(3, vent.getMonto());
            //cs.setInt(4, vent.getId());
            cs.registerOutParameter(4, Types.INTEGER);
            cs.execute();
            ok = cs.getInt(4);
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertCabeceraVTA es:" + e.toString());
        }
        return ok;

    }

    @Override
    public boolean insertDetalleVentas(Ventas vent) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarDetalle_Ventas`(?,?,?,?)");
            cs.setInt(1, vent.getId_venta());
            cs.setInt(2, vent.getId_producto());
            cs.setDouble(3, vent.getCantidad());
            cs.setDouble(4, vent.getPrecio_venta());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertDetalleVTA es:" + e.toString());
        }
        return ok;

    }

    @Override
    public List listarVentas() {

        ArrayList<Ventas> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_HistorialVentas`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Ventas venta = new Ventas();
                venta.setId_venta(rs.getInt("id_venta"));
                venta.setCliente(rs.getString("cliente"));
                venta.setMonto(rs.getDouble("monto"));
                venta.setFecha_venta(rs.getString("fecha_venta"));
                venta.setUsuario(rs.getString("usuario"));

                list.add(venta);
            }

        } catch (Exception e) {
            System.out.println("error en ListarVenta: " + e.toString());
        }

        return list;

    }

    @Override
    public boolean AnularVenta(int id) {

        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_AnularVenta`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            //cs.close();
        } catch (Exception e) {
            System.out.println("el error en AnularVentas es:" + e.toString());
        }
        return ok;

    }
    
    
public int insertCabeceraVentas2(Ventas vent) {
    int idVenta = 0; // Inicializar con un valor que indique que no se ha insertado correctamente
    try {
        con = cn.getConexion();
        cs = con.prepareCall("CALL `sp_InsertarCabeceraVentas`(?,?,?,?)");
        cs.setInt(1, vent.getId_persona());
        cs.setInt(2, vent.getId_usuario());
        cs.setDouble(3, vent.getMonto());
        cs.registerOutParameter(4, Types.INTEGER);
        cs.execute();
        idVenta = cs.getInt(4); // Obtener el ID de la venta creada
        cs.close();

    } catch (Exception e) {
        System.out.println("El error en insertCabeceraVTA es:" + e.toString());
    }
    return idVenta;
}

    

}
