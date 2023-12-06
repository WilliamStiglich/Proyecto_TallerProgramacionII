package interfaces;

import java.sql.ResultSet;
import java.util.List;
import modelo.Persona;

public interface CRUD {

    public List listar();

    public Persona list(int id);

    public boolean add(Persona per);

    public boolean edit(Persona per);

    public boolean del(int id);

    public List listar_id(int id);
    
    public List cargaPersonas();

}
