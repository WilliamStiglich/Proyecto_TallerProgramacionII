/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.marcas;
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
public class MarcasDAO implements marcas {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List cargaMarcas() {

        ArrayList<Marcas> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_cargaMarca`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Marcas mar = new Marcas();
                mar.setId_marca(rs.getInt("id_marca"));
                mar.setMarca(rs.getString("marca"));
                list.add(mar);
            }
        } catch (SQLException e) {
            System.out.println("error en Categoria: " + e.toString());
        }
        return list;

    }

    @Override
    public boolean insertMarca(Marcas marca) {

        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarMarca`(?)");
            cs.setString(1, marca.getMarca());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertMarca es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarMarca() {

        ArrayList<Marcas> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_cargaMarca`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Marcas mar = new Marcas();
                mar.setId_marca(rs.getInt("id_marca"));
                mar.setMarca(rs.getString("marca"));
                list.add(mar);
            }

        } catch (Exception e) {
            System.out.println("error en Listar: " + e.toString());
        }

        return list;

    }

    @Override
    public boolean deleteMarcas(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarMarcas`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteMarcas es:" + e.toString());
        }
        return ok;

    }

    @Override
    public boolean editMarcas(Marcas marca) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarMarca`(?,?) ");
            cs.setInt(1, marca.getId_marca());
            cs.setString(2, marca.getMarca());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;

    }

    @Override
    public List listarMarcas_id(int id) {

        ArrayList<Marcas> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarMarca_Id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Marcas mar = new Marcas();
                mar.setId_marca(rs.getInt("id_marca"));
                mar.setMarca(rs.getString("marca"));
                list.add(mar);
            }

        } catch (Exception e) {
            System.out.println("error en ListarMarcas_id: " + e.toString());
        }
        return list;

    }

}
