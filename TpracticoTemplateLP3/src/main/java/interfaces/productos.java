/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Productos;

/**
 *
 * @author DELL
 */
public interface productos {
     public boolean insertProd(Productos prod);
      public List listarProd();
      public List listarProd_id(int id);
      public boolean editProd(Productos prod);
      public boolean deleteProd(int id);
      
       public List listarProd_id2(int id);
      public boolean editProd2(Productos prod);
      public List cargaProductos();
}
