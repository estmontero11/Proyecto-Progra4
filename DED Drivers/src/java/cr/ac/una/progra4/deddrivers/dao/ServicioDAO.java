/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.dao;

import cr.ac.una.progra4.deddrivers.domain.Servicio;
import cr.ac.una.progra4.deddrivers.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Daniel
 */
public class ServicioDAO extends HibernateUtil implements cr.ac.una.progra4.deddrivers.dao.IBaseDAO<Servicio, Integer>{
    @Override
    public void save(Servicio o) {
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
    public Servicio merge(Servicio o) {
        try {
            iniciaOperacion();
            o = (Servicio) getSesion().merge(o);
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
    public void delete(Servicio o) {
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
    public Servicio findById(Integer id) {
        Servicio servicio = null;

        try {
            iniciaOperacion();
            servicio = (Servicio) getSesion().get(Servicio.class, id);
        } finally {
            getSesion().close();
        }
        return servicio;
    }

    @Override
    public List<Servicio> findAll() {
        List<Servicio> listaServicio;
        try {
            iniciaOperacion();//HQL
            listaServicio = getSesion().createQuery("from Servicio").list();
        } finally {
            getSesion().close();
        }

        return listaServicio;
    }
}
