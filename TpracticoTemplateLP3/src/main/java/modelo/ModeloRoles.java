
package Modelo;

public class ModeloRoles {
     String nombre;
     String apellido; 
     String rol;

    public ModeloRoles() {
    }

    public ModeloRoles(String nombre, String apellido, String rol) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.rol = rol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
     
}
