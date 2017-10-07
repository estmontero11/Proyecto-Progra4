/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.bl;

<<<<<<< HEAD
=======
import cr.ac.una.progra4.deddrivers.dao.ChoferDAO;
import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.dao.UsuarioDAO;
import cr.ac.una.progra4.deddrivers.dao.VehiculoDAO;
>>>>>>> 1408d49c7b344e8a113f9f86d6bf331768fbed59
import cr.ac.una.progra4.deddrivers.dao.IBaseDAO;
import cr.ac.una.progra4.deddrivers.dao.*;
import java.util.LinkedHashMap;

/**
 *
 * @author chgari
 */
public class BaseBL {
    private final LinkedHashMap<String, IBaseDAO> daos;

    public BaseBL() {
        daos = new LinkedHashMap();
<<<<<<< HEAD
        daos.put("cr.ac.una.progra4.deddrivers.domain.Chofer", new ChoferDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Servicio", new ServicioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Vehiculo", new VehiculoDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Usuario", new UsuarioDAO());
=======
        daos.put("cr.ac.una.progra4.deddrivers.Chofer", new ChoferDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Chofer", new ServicioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Usuario", new UsuarioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Vehiculo", new VehiculoDAO());
        
>>>>>>> 1408d49c7b344e8a113f9f86d6bf331768fbed59
    }
    
    public IBaseDAO getDao(String className){
        return daos.get(className);
    }
}
