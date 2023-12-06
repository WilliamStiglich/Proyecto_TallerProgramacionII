/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Categoria;

/**
 *
 * @author DELL
 */
public interface categorias {
    public List cargaCategoria();
     public boolean insertCategoria(Categoria cate);

    public List listarCategoria();
    public boolean deleteCategoria(int id);
    
     public boolean editCategorias(Categoria cate);

    public List listarCateg_id(int id);
}
