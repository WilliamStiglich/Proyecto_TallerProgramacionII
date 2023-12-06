/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Nacionalidad;

/**
 *
 * @author DELL
 */
public interface nacionalidad {

    public List cargaNacionalidad();

    public boolean insertNacionalidad(Nacionalidad nac);

    public boolean deleteNacionalidad(int id);

    public boolean editNacionalidad(Nacionalidad nac);

    public List listarNacionalidad_id(int id);
}
