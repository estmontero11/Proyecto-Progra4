/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.bl;

import cr.ac.una.progra4.deddrivers.dao.ChoferDAO;
import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.dao.UsuarioDAO;
import cr.ac.una.progra4.deddrivers.dao.VehiculoDAO;
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
        daos.put("cr.ac.una.progra4.deddrivers.Chofer", new ChoferDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Chofer", new ServicioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Usuario", new UsuarioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.Vehiculo", new VehiculoDAO());
        
    }
    
    public IBaseDAO getDao(String className){
        return daos.get(className);
    }
}
