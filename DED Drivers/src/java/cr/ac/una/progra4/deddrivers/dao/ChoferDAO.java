/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.dao;

import cr.ac.una.progra4.deddrivers.domain.Chofer;
import cr.ac.una.progra4.deddrivers.utils.HibernateUtil;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.HibernateException;

/**
 *
 * @author Daniel
 */
public class ChoferDAO extends HibernateUtil implements cr.ac.una.progra4.deddrivers.dao.IBaseDAO<Chofer, Integer>{

    @Override
    public void save(Chofer o) {
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
    public Chofer merge(Chofer o) throws HibernateException {
        try {
            iniciaOperacion();
            o = (Chofer) getSesion().merge(o);
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
    public void delete(Chofer o) {
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
    public Chofer findById(Integer id) {
        Chofer chofer = null;

        try {
            iniciaOperacion();
            chofer = (Chofer) getSesion().get(Chofer.class, id);
        } finally {
            getSesion().close();
        }
        return chofer;
    }

    @Override
    public List<Chofer> findAll() {
        List<Chofer> listaChofer;
        try {
            iniciaOperacion();//HQL
            listaChofer = getSesion().createQuery("from Chofer").list();
        } finally {
            getSesion().close();
        }

        return listaChofer;
    }
    
    public List<Chofer> findByName(String name) {
        List<Chofer> listaChoferes;
        
        try {
            iniciaOperacion();
            listaChoferes = getSesion().createQuery("from Chofer where nombre like '%%%"+ name +"%%'").list();
        } finally {
            getSesion().close();
        }
        return listaChoferes;
    }
}
