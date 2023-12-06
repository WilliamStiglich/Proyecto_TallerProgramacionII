/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Ventas;

/**
 *
 * @author DELL
 */
public interface ventas {
    public int insertCabeceraVentas(Ventas vent);
    public boolean insertDetalleVentas(Ventas vent); 
    public List listarVentas(); 
    public boolean AnularVenta(int id);
}
