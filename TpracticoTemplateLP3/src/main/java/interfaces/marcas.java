/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Marcas;

/**
 *
 * @author DELL
 */
public interface marcas {

    public List cargaMarcas();

    public boolean insertMarca(Marcas marca);

    public List listarMarca();

    public boolean deleteMarcas(int id);

    public boolean editMarcas(Marcas marca);

    public List listarMarcas_id(int id);

}
