
package modelo;

public class Menu {
    String menu;
    String enlace;
    int id_cab_menu;

    public Menu() {
    }

    public Menu(String menu, String enlace, int id_cab_menu) {
        this.menu = menu;
        this.enlace = enlace;
        this.id_cab_menu = id_cab_menu;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getEnlace() {
        return enlace;
    }

    public void setEnlace(String enlace) {
        this.enlace = enlace;
    }

    public int getId_cab_menu() {
        return id_cab_menu;
    }

    public void setId_cab_menu(int id_cab_menu) {
        this.id_cab_menu = id_cab_menu;
    }
 
    
    
}
