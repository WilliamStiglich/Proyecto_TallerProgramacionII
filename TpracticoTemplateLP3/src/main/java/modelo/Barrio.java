/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DELL
 */
public class Barrio {
     private int id_barrio;
    private String barrio;

    public Barrio() {
    }

    public Barrio(int id_barrio, String barrio) {
        this.id_barrio = id_barrio;
        this.barrio = barrio;
    }

    public int getId_barrio() {
        return id_barrio;
    }

    public void setId_barrio(int id_barrio) {
        this.id_barrio = id_barrio;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }
    
}
