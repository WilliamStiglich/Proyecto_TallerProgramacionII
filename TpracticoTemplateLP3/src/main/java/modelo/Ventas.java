/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DELL
 */
public class Ventas {
    int id, id_persona,
            id_usuario,
          
            id_venta,
            id_producto;

    public Ventas(int id, int id_persona, int id_usuario, int id_venta, int id_producto, String cliente, String producto_venta, String usuario, String fecha_venta, String estado, Double monto, Double cantidad, Double precio_venta) {
        this.id = id;
        this.id_persona = id_persona;
        this.id_usuario = id_usuario;
        this.id_venta = id_venta;
        this.id_producto = id_producto;
        this.cliente = cliente;
        this.producto_venta = producto_venta;
        this.usuario = usuario;
        this.fecha_venta = fecha_venta;
        this.estado = estado;
        this.monto = monto;
        this.cantidad = cantidad;
        this.precio_venta = precio_venta;
    }
           
          
    String cliente,producto_venta,usuario,fecha_venta,estado;
     double monto, cantidad,  precio_venta;

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public Double getCantidad() {
        return cantidad;
    }

    public void setCantidad(Double cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(Double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public String getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Ventas(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getProducto_venta() {
        return producto_venta;
    }

    public void setProducto_venta(String producto_venta) {
        this.producto_venta = producto_venta;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Ventas(String cliente, String producto_venta, String usuario) {
        this.cliente = cliente;
        this.producto_venta = producto_venta;
        this.usuario = usuario;
    }

    public Ventas() {
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

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    
    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

   

     
}
