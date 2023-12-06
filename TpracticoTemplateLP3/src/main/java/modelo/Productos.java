/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DELL
 */
public class Productos {
    int id_producto,id_categoria,id_marca,precioUn,costo,precioMay,cantidad,stock;

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Productos(int stock) {
        this.stock = stock;
    }
    String producto,categoria,marca,descripcion,producto_venta;

    public String getProducto_venta() {
        return producto_venta;
    }

    public void setProducto_venta(String producto_venta) {
        this.producto_venta = producto_venta;
    }

    public Productos(String producto_venta) {
        this.producto_venta = producto_venta;
    }

    public Productos() {
    }

    public Productos(int id_producto, int id_categoria, int id_marca, int precioUn, int costo, int precioMay, int cantidad, String producto, String categoria, String marca, String descripcion) {
        this.id_producto = id_producto;
        this.id_categoria = id_categoria;
        this.id_marca = id_marca;
        this.precioUn = precioUn;
        this.costo = costo;
        this.precioMay = precioMay;
        this.cantidad = cantidad;
        this.producto = producto;
        this.categoria = categoria;
        this.marca = marca;
        this.descripcion = descripcion;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getPrecioUn() {
        return precioUn;
    }

    public void setPrecioUn(int precioUn) {
        this.precioUn = precioUn;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public int getPrecioMay() {
        return precioMay;
    }

    public void setPrecioMay(int precioMay) {
        this.precioMay = precioMay;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
 
}
