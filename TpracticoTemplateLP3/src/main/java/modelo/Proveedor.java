/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DELL
 */
public class Proveedor {
    int id_proveedor;
    String proveedor,ruc,proveedores;

    public Proveedor() {
    }

    public Proveedor(int id_proveedor, String proveedor, String ruc, String proveedores) {
        this.id_proveedor = id_proveedor;
        this.proveedor = proveedor;
        this.ruc = ruc;
        this.proveedores = proveedores;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getProveedores() {
        return proveedores;
    }

    public void setProveedores(String proveedores) {
        this.proveedores = proveedores;
    }

     
    
    
}
