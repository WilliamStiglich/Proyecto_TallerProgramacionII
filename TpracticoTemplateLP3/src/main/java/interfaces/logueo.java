/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.sql.ResultSet;
import java.util.List;
import modelo.Usuario;

/**
 *
 * @author DELL
 */
public interface logueo {

    public ResultSet login(Usuario user);

    public boolean addUser(Usuario user);
    
    public List listar_idUSU(int id);
    
    public boolean editUser(Usuario user);
    
    public ResultSet login2(Usuario user);

}
