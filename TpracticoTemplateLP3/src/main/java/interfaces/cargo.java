/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Cargo;

/**
 *
 * @author DELL
 */
public interface cargo {

    public List cargaCargo();

    public boolean insertCargo(Cargo car);

    public boolean deleteCargo (int id);

    public boolean editCargo (Cargo car);

    public List listarCargo_id(int id);
}
