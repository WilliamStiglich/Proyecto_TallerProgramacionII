
package modelo;

import cx.conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MenuDAO {
    
    ResultSet rs;
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;
    
    public List menu_dinamico(String usu, String pass) {
        ArrayList<Menu> list = new ArrayList<>();
        
        try {
            con = cn.getConexion();
            ps = con.prepareStatement("CALL `sp_login5`(?,?)");    
            ps.setString(1, usu);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                Menu menu = new Menu();
                menu.setMenu(rs.getString("menu"));
                menu.setEnlace(rs.getString("enlace"));
                menu.setId_cab_menu(rs.getInt("id_cab_menu"));
                list.add(menu);                
            }
        } catch (Exception e) {
            System.out.println("error listar: "+e.toString());
        }        
        return list;
    }
}
