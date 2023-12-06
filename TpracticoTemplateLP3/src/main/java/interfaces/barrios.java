/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Barrio;

/**
 *
 * @author DELL
 */
public interface barrios {

    public List cargaBarrio();

    public boolean insertBarrio(Barrio bar);

    public boolean deleteBarrio(int id);

    public boolean editBarrio(Barrio bar);

    public List listarBarrio_id(int id);
}
