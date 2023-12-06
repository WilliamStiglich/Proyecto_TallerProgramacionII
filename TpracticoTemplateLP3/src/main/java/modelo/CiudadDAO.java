/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.ciudades;
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
public class CiudadDAO implements ciudades {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List cargaCiudad() {

        ArrayList<Ciudad> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaCiudad`");
            rs = ps.executeQuery();
            while (rs.next()) {
                Ciudad ciu = new Ciudad();
                ciu.setId_ciudad(rs.getInt("id_ciudad"));
                ciu.setCiudad(rs.getString("ciudad"));
                list.add(ciu);
            }
        } catch (SQLException e) {
            System.out.println("error en Categoria: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean insertCiudad(Ciudad ciu) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarCiudad`(?)");
            cs.setString(1, ciu.getCiudad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertCiudad es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean deleteCiudad(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarCiudad`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteCiudad es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean editCiudad(Ciudad ciu) {
     boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarCiudad`(?,?) ");
            cs.setInt(1, ciu.getId_ciudad());
            cs.setString(2, ciu.getCiudad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarCiudad_id(int id) {
     ArrayList<Ciudad> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarCiudad_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Ciudad ciu = new Ciudad();
                ciu.setId_ciudad(rs.getInt("id_ciudad"));
                ciu.setCiudad(rs.getString("ciudad"));
                list.add(ciu);
            }

        } catch (Exception e) {
            System.out.println("error en ListarCiudad_id: " + e.toString());
        }
        return list;
    }

}
