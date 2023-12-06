/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.barrios;
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
public class BarrioDAO implements barrios {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List cargaBarrio() {
        ArrayList<Barrio> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaBarrio`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Barrio ba = new Barrio();
                ba.setId_barrio(rs.getInt("id_barrio"));
                ba.setBarrio(rs.getString("barrio"));
                list.add(ba);
            }
        } catch (SQLException e) {
            System.out.println("error en Categoria: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean insertBarrio(Barrio bar) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarBarrio`(?)");
            cs.setString(1, bar.getBarrio());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertBarrio es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean deleteBarrio(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarBarrio`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteBarrio es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean editBarrio(Barrio bar) {
    boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarBarrio`(?,?) ");
            cs.setInt(1, bar.getId_barrio());
            cs.setString(2, bar.getBarrio());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en EditBarrio es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarBarrio_id(int id) {
        ArrayList<Barrio> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarBarrio_Id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Barrio bar = new Barrio();
                bar.setId_barrio(rs.getInt("id_barrio"));
                bar.setBarrio(rs.getString("barrio"));
                list.add(bar);
            }

        } catch (Exception e) {
            System.out.println("error en ListarCiudad_id: " + e.toString());
        }
        return list;
    }

}
