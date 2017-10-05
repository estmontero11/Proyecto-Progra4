/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.bl;

import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import java.util.List;

/**
 *
 * @author chgari
 */
public class ServicioBL extends BaseBL implements IBaseBL<Servicio, Integer>{
    public ServicioBL() {
        super();
    }
    
    @Override
    public void save(Servicio o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Servicio merge(Servicio o) {
        return (Servicio) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Servicio o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Servicio findById(Integer o) {
        return (Servicio) this.getDao(o.getClass().getName()).findById(o);
    }

    @Override
    public List<Servicio> findAll(String className) {
        return this.getDao(className).findAll();
    }
}
