/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.bl;

import cr.ac.una.progra4.deddrivers.dao.ChoferDAO;
import cr.ac.una.progra4.deddrivers.domain.Chofer;
import java.util.List;

/**
 *
 * @author chgari
 */
public class ChoferBL extends BaseBL implements IBaseBL<Chofer, Integer>{
    public ChoferBL() {
        super();
    }
    
    @Override
    public void save(Chofer o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Chofer merge(Chofer o) {
        return (Chofer) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Chofer o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Chofer findById(Integer o) {
        return (Chofer) this.getDao(o.getClass().getName()).findById(o);
    }

    @Override
    public List<Chofer> findAll(String className) {
        return this.getDao(className).findAll();
    }
}
