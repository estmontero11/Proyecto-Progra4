/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.bl;


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

        daos.put("cr.ac.una.progra4.deddrivers.domain.Chofer", new ChoferDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Servicio", new ServicioDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Vehiculo", new VehiculoDAO());
        daos.put("cr.ac.una.progra4.deddrivers.domain.Usuario", new UsuarioDAO());
    }
    
    public IBaseDAO getDao(String className){
        return daos.get(className);
    }
}
