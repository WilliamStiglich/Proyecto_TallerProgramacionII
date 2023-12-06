/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Paises;

/**
 *
 * @author DELL
 */
public interface paises {

    public List cargaPais();

    public boolean insertPais(Paises pai);

    public boolean deletePais(int id);

    public boolean editPais(Paises pai);

    public List listarPaises_id(int id);

}
