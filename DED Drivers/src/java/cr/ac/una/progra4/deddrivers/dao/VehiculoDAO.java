/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.dao;

import cr.ac.una.progra4.deddrivers.domain.Vehiculo;
import cr.ac.una.progra4.deddrivers.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Daniel
 */
public class VehiculoDAO extends HibernateUtil implements cr.ac.una.progra4.deddrivers.dao.IBaseDAO<Vehiculo, Integer>{
    @Override
    public void save(Vehiculo o) {
           try {
            iniciaOperacion();
            getSesion().save(o);
            getTransac().commit();
        } catch (HibernateException he) {
            manejaExcepcion(he);
            throw he;
        } finally {
            getSesion().close();
        }
    }

    @Override
    public Vehiculo merge(Vehiculo o) {
        try {
            iniciaOperacion();
            o = (Vehiculo) getSesion().merge(o);
            getTransac().commit();
        } catch (HibernateException he) {
            manejaExcepcion(he);
            throw he;
        } finally {
            getSesion().close();
        }
        return o;
    }

    @Override
    public void delete(Vehiculo o) {
        try {
            iniciaOperacion();
            getSesion().delete(o);
            getTransac().commit();
        } catch (HibernateException he) {
            manejaExcepcion(he);
            throw he;
        } finally {
            getSesion().close();
        }
    }

    @Override
    public Vehiculo findById(Integer id) {
        Vehiculo chofer = null;

        try {
            iniciaOperacion();
            chofer = (Vehiculo) getSesion().get(Vehiculo.class, id);
        } finally {
            getSesion().close();
        }
        return chofer;
    }

    @Override
    public List<Vehiculo> findAll() {
        List<Vehiculo> listaVehiculo;
        try {
            iniciaOperacion();//HQL
            listaVehiculo = getSesion().createQuery("from Vehiculo").list();
        } finally {
            getSesion().close();
        }

        return listaVehiculo;
    }
    
    public List<Vehiculo> findByName(int id){
    List<Vehiculo> listaVehiculos;
    try {
    iniciaOperacion();
    listaVehiculos = getSesion().createQuery("from Vehiculo where id like '%%%"+ id +"%%'").list();
    } finally{
    getSesion().close();
    }
    return listaVehiculos;
    }
}