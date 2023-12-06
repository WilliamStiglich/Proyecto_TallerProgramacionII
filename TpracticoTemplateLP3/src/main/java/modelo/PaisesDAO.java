/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.paises;
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
public class PaisesDAO implements paises{

     ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;
    
    @Override
    public List cargaPais() {
        ArrayList<Paises> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaPais`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Paises pa = new Paises();
                pa.setId_pais(rs.getInt("id_pais"));
                pa.setPais(rs.getString("pais"));
                list.add(pa);
            }
        } catch (SQLException e) {
            System.out.println("error en Paises: " + e.toString());
        }
        return list;
    }

    @Override
    public boolean insertPais(Paises pai) {
       boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarPais` (?)");
            cs.setString(1, pai.getPais());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertPais es:" + e.toString());
        }
        return ok;
    
    }

    @Override
    public boolean deletePais(int id) {
     boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarPais`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeletePais es:" + e.toString());
        }
        return ok;
    
    }

    @Override
    public boolean editPais(Paises pai) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarPais`(?,?) ");
            cs.setInt(1, pai.getId_pais());
            cs.setString(2, pai.getPais());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;
    
    }

    @Override
    public List listarPaises_id(int id) {
     ArrayList<Paises> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarPais_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Paises pai = new Paises();
                pai.setId_pais(rs.getInt("id_pais"));
                pai.setPais(rs.getString("pais"));
                list.add(pai);
            }

        } catch (Exception e) {
            System.out.println("error en ListarPais_id: " + e.toString());
        }
        return list;
    }
    
}
