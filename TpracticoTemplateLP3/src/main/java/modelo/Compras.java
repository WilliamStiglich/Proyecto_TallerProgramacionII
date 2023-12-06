/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DELL
 */
public class Compras {
    
    int id, id_persona,
            id_proveedor,
            monto,
            id_compra,
            id_producto,
            cantidad,
            precio_compra,subtotal;
    String proveedor,producto_compra,fecha_compra;
    String descripcion, estado;
    int item; 

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public Compras(int id, int id_persona, int id_proveedor, int monto, int id_compra, int id_producto, int cantidad, int precio_compra, int subtotal, String proveedor, String producto_compra, String fecha_compra, String descripcion, String estado, int item) {
        this.id = id;
        this.id_persona = id_persona;
        this.id_proveedor = id_proveedor;
        this.monto = monto;
        this.id_compra = id_compra;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio_compra = precio_compra;
        this.subtotal = subtotal;
        this.proveedor = proveedor;
        this.producto_compra = producto_compra;
        this.fecha_compra = fecha_compra;
        this.descripcion = descripcion;
        this.estado = estado;
        this.item = item;
    }
    

    public Compras(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
    

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getProducto_compra() {
        return producto_compra;
    }

    public void setProducto_compra(String producto_compra) {
        this.producto_compra = producto_compra;
    }

    public String getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(String fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public Compras(String proveedor, String producto_compra, String fecha_compra) {
        this.proveedor = proveedor;
        this.producto_compra = producto_compra;
        this.fecha_compra = fecha_compra;
    }

    public Compras() {
    }

    public Compras(int id, int id_persona, int id_proveedor, int monto, int id_compra, int id_producto, int cantidad, int precio_compra) {
        this.id = id;
        this.id_persona = id_persona;
        this.id_proveedor = id_proveedor;
        this.monto = monto;
        this.id_compra = id_compra;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio_compra = precio_compra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(int precio_compra) {
        this.precio_compra = precio_compra;
    }
    
    
    
}
