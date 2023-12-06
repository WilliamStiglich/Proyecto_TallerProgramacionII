package modelo;

public class Persona {

    int id_persona, id_ciudad, id_barrio, id_pais, id_nacionalidad;
    String estado;
    String cedula;
    String nombre;
    String apellido;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Persona(int id_persona, int id_ciudad, int id_barrio, int id_pais, int id_nacionalidad, String estado, String cedula, String nombre, String apellido, String persona, String direccion, String ciudad, String barrio, String pais, String nacionalidad) {
        this.id_persona = id_persona;
        this.id_ciudad = id_ciudad;
        this.id_barrio = id_barrio;
        this.id_pais = id_pais;
        this.id_nacionalidad = id_nacionalidad;
        this.estado = estado;
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.persona = persona;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.barrio = barrio;
        this.pais = pais;
        this.nacionalidad = nacionalidad;
    }
    String persona;
    String direccion;
    String ciudad, barrio, pais, nacionalidad;

    public Persona(int id_ciudad, int id_barrio, int id_pais, int id_nacionalidad) {
        this.id_ciudad = id_ciudad;
        this.id_barrio = id_barrio;
        this.id_pais = id_pais;
        this.id_nacionalidad = id_nacionalidad;
    }

    public Persona(String direccion, String ciudad, String barrio, String pais, String nacionalidad) {
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.barrio = barrio;
        this.pais = pais;
        this.nacionalidad = nacionalidad;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public int getId_barrio() {
        return id_barrio;
    }

    public void setId_barrio(int id_barrio) {
        this.id_barrio = id_barrio;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

    public int getId_nacionalidad() {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(int id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public Persona(String persona) {
        this.persona = persona;
    }

    public Persona() {
    }

    public Persona(String cedula, String nombre, String apellido) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public Persona(int id_persona, String cedula, String nombre, String apellido) {
        this.id_persona = id_persona;
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
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

}
