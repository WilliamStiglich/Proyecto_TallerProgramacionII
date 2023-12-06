/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import cx.conexion;
import interfaces.categorias;
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
public class CategoriaDAO implements categorias{
    
    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;
    

    @Override
    public List cargaCategoria() {
    
    ArrayList<Categoria> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_cargaCategoria`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria cate = new Categoria();
                cate.setId_categoria(rs.getInt("id_categoria"));
                cate.setCategoria(rs.getString("categoria"));
                list.add(cate);
            }
        } catch (SQLException e) {
            System.out.println("error en Categoria: " + e.toString());
        }
        return list;
    } 

    @Override
    public boolean insertCategoria(Categoria cate) {
    
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarCategoria`(?)");
            cs.setString(1, cate.getCategoria());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en insertCategoria es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarCategoria() {
      
         ArrayList<Categoria> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_cargaCategoria`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categ = new Categoria();
                categ.setId_categoria(rs.getInt("id_categoria"));
                categ.setCategoria(rs.getString("categoria"));
                list.add(categ);
            }

        } catch (Exception e) {
            System.out.println("error en Listar: " + e.toString());
        }

        return list;
        
       
    }

    @Override
    public boolean deleteCategoria(int id) {
       boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarCategorias`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en DeleteCategorias es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean editCategorias(Categoria cate) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EditarCategoria`(?,?) ");
            cs.setInt(1, cate.getId_categoria());
            cs.setString(2, cate.getCategoria());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listarCateg_id(int id) {
        ArrayList<Categoria> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_ListarCategoria_Id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Categoria categ = new Categoria();
                categ.setId_categoria(rs.getInt("id_categoria"));
                categ.setCategoria(rs.getString("categoria"));
                list.add(categ);
            }

        } catch (Exception e) {
            System.out.println("error en ListarMarcas_id: " + e.toString());
        }
        return list;
 
    }
}
