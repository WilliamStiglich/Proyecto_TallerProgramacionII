/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Ciudad;

/**
 *
 * @author DELL
 */
public interface ciudades {

    public List cargaCiudad();

    public boolean insertCiudad(Ciudad ciu);

    public boolean deleteCiudad(int id);

    public boolean editCiudad(Ciudad ciu);

    public List listarCiudad_id(int id);
}
