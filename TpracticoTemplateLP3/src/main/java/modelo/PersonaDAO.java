package modelo;

import com.mysql.cj.protocol.Resultset;
import cx.conexion;
import interfaces.CRUD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD {

    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_listarClientes`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Persona per = new Persona();
                per.setId_persona(rs.getInt("id_persona"));
                per.setCedula(rs.getString("cedula"));
                per.setNombre(rs.getString("nombres"));
                per.setApellido(rs.getString("apellidos"));
                per.setDireccion(rs.getString("direccion"));
                per.setCiudad(rs.getString("ciudad"));
                per.setBarrio(rs.getString("barrio"));
                per.setPais(rs.getString("pais"));
                per.setNacionalidad(rs.getString("nacionalidad"));
                list.add(per);
            }

        } catch (Exception e) {
            System.out.println("error en Listar: " + e.toString());
        }

        return list;
    }

    @Override
    public Persona list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean add(Persona per) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_InsertarPersonas`(?,?,?,?,?,?,?,?)");
            cs.setString(1, per.getCedula());
            cs.setString(2, per.getNombre());
            cs.setString(3, per.getApellido());
            cs.setString(4, per.getDireccion());
            cs.setInt(5, per.getId_ciudad());
            cs.setInt(6, per.getId_barrio());
            cs.setInt(7, per.getId_pais());
            cs.setInt(8, per.getId_nacionalidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Add es:" + e.toString());
        }
        return ok;
    }

    @Override
    public boolean edit(Persona per) {

        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_editarPersonas`(?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, per.getId_persona());
            cs.setString(2, per.getCedula());
            cs.setString(3, per.getNombre());
            cs.setString(4, per.getApellido());
            cs.setString(5, per.getDireccion());
            cs.setInt(6, per.getId_ciudad());
            cs.setInt(7, per.getId_barrio());
            cs.setInt(8, per.getId_pais());
            cs.setInt(9, per.getId_nacionalidad());
            ok = cs.execute();
            cs.close();

        } catch (Exception e) {
            System.out.println("el error en Editar es:" + e.toString());
        }
        return ok;

    }

    @Override
    public boolean del(int id) {
        boolean ok = true;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_EliminarPersonas`(?)");
            cs.setInt(1, id);
            ok = cs.execute();
            cs.close();
        } catch (Exception e) {
            System.out.println("el error en Delete es:" + e.toString());
        }
        return ok;
    }

    @Override
    public List listar_id(int id) {
        ArrayList<Persona> list = new ArrayList<>();

        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_listarClientes_id`(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Persona per = new Persona();
                per.setId_persona(rs.getInt("id_persona"));
                per.setCedula(rs.getString("cedula"));
                per.setNombre(rs.getString("nombres"));
                per.setApellido(rs.getString("apellidos"));
                per.setDireccion(rs.getString("direccion"));
                per.setId_ciudad(rs.getInt("id_ciudad"));
                per.setId_barrio(rs.getInt("id_barrio"));
                per.setId_pais(rs.getInt("id_pais"));
                per.setId_nacionalidad(rs.getInt("id_nacionalidad"));
                list.add(per);
            }

        } catch (Exception e) {
            System.out.println("error en ListarClientes_id: " + e.toString());
        }

        return list;
    }

    @Override
    public List cargaPersonas() {
        ArrayList<Persona> list = new ArrayList<>();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_cargaClientesPersonas`()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Persona per = new Persona();
                per.setId_persona(rs.getInt("id_persona"));
                per.setPersona(rs.getString("persona"));
                list.add(per);
            }
        } catch (SQLException e) {
            System.out.println("error en CargaPersona: " + e.toString());
        }
        return list;

    }

    public boolean CedulaExiste(Persona per) {
        boolean existe = false;
        ResultSet rs = null;
        try {
            con = cn.getConexion();
            cs = con.prepareCall("CALL `sp_CedulaYaExiste`(?)");
            cs.setString(1, per.getCedula());
            //ResultSet rs = cs.executeQuery();
            rs = cs.executeQuery();
            //cs.close();
            if (rs.next()) {
                // Si el ResultSet contiene al menos un resultado, significa que el usuario ya existe
                existe = true;
            }
            rs.close();
            cs.close();
        } catch (Exception e) {
            System.out.println("El error en Cedulaexiste es: " + e.toString());
        } finally {
            // Asegúrate de cerrar la conexión aquí si es necesario
            // Cerrar recursos (ResultSet, Statement, Connection) es importante para evitar fugas de recursos.
        }
        return existe;
    }

    public Persona buscar(String ci) {
        Persona c = new Persona();
        String sql = "Select * from personas where cedula=" + ci;
        try {
            while (rs.next()) {
                c.setId_persona(rs.getInt(1));
                c.setCedula(rs.getString(2));
                c.setPersona(rs.getString(3));
                c.setDireccion(rs.getString(4));
                c.setEstado(rs.getString(5));
            }
        } catch (Exception e) {
        }

        return c;
    }

}
