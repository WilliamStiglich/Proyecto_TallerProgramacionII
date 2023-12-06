/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.Proveedor;

/**
 *
 * @author DELL
 */
public interface proveedor {

    public List cargaProveedor();

    public boolean insertProveedor(Proveedor prove);

    public boolean deleteProveedor(int id);

    public boolean editProveedor(Proveedor prove);

    public List listarProveedor_id(int id);
    public List listaDeProveedores();
}
