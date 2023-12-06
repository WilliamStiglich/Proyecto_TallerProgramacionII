/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.nacionalidad;
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
public class NacionalidadDAO implements nacionalidad{
    
    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List cargaNacionalidad() {
          ArrayList<Nacionalidad> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_CargaNacionalidad`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Nacionalidad nac = new Nacionalidad();
                nac.setId_nacionalidad(rs.getInt("id_nacionalidad"));
                nac.setNacionalidad(rs.getString("nacionalidad"));
                list.add(nac);
            }
        } catch (SQLException e) {
            System.out.println("error en Nacionalidad: " + e.toString());
        }
        return list;
    
    }

    @Override
    public boolean insertNacionalidad(Nacionalidad nac) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_Insertar_Nacionalidad`(?)");
            cs.setString(1, nac.getNacionalidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertNacionalidad es:" + e.toString());
        }
        return ok;
    
    }

    @Override
    public boolean deleteNacionalidad(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarNacionalidad`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteNac es:" + e.toString());
        }
        return ok;
   
    }

    @Override
    public boolean editNacionalidad(Nacionalidad nac) {
         boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_Editar_Nac`(?,?) ");
            cs.setInt(1, nac.getId_nacionalidad());
            cs.setString(2, nac.getNacionalidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarNacionalidad_id(int id) {
        ArrayList<Nacionalidad> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_Listar_Nac_Id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Nacionalidad nac = new Nacionalidad();
                nac.setId_nacionalidad(rs.getInt("id_nacionalidad"));
                nac.setNacionalidad(rs.getString("nacionalidad"));
                list.add(nac);
            }

        } catch (Exception e) {
            System.out.println("error en ListarPais_id: " + e.toString());
        }
        return list;
    
    }
    
}
