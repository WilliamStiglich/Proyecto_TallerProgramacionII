/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Compras;

/**
 *
 * @author DELL
 */
public interface compras {
    public int insertCabeceraCompras(Compras comp);
    public boolean insertDetalleCompras(Compras comp);
     public List listarCompras(); 
     public boolean AnularCompra(int id);
}
