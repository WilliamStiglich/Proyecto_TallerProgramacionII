/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.cargo;
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
public class CargoDAO implements cargo{
    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;
    
   @Override
     public List cargaCargo() {
    
    ArrayList<Cargo> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaPuestoDeTrabajo`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Cargo car = new Cargo();
                car.setId_rol(rs.getInt("id_rol"));
                car.setRol(rs.getString("rol"));
                list.add(car);
            }
        } catch (SQLException e) {
            System.out.println("error en Categoria: " + e.toString());
        }
        return list;
    } 

    @Override
    public boolean insertCargo(Cargo car) {
    boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarCargos`(?)");
            cs.setString(1, car.getRol());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertCargos es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean deleteCargo(int id) {
     boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarCargos`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteCargos es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean editCargo(Cargo car) {
      boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarPuestoTrabajo`(?,?) ");
            cs.setInt(1, car.getId_rol());
            cs.setString(2, car.getRol());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en EditPtoTrabajo es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarCargo_id(int id) {
      ArrayList<Cargo> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarPtoTrabajo_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Cargo carg = new Cargo();
                carg.setId_rol(rs.getInt("id_rol"));
                carg.setRol(rs.getString("rol"));
                list.add(carg);
            }

        } catch (Exception e) {
            System.out.println("error en ListarPtoTrabajo_id: " + e.toString());
        }
        return list;
    
    }
    
}
