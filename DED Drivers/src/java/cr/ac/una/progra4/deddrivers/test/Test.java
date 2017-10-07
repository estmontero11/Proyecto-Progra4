/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.test;

////////////////////////////// Clases //////////////////////////////
import cr.ac.una.progra4.deddrivers.domain.Chofer;
<<<<<<< HEAD
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import cr.ac.una.progra4.deddrivers.domain.Usuario;
import cr.ac.una.progra4.deddrivers.domain.Vehiculo;

////////////////////////////// DAOs //////////////////////////////
import cr.ac.una.progra4.deddrivers.dao.ChoferDAO;
import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.dao.UsuarioDAO;
import cr.ac.una.progra4.deddrivers.dao.VehiculoDAO;

////////////////////////////// BLs //////////////////////////////
import cr.ac.una.progra4.deddrivers.bl.ChoferBL;
import cr.ac.una.progra4.deddrivers.bl.ServicioBL;
import cr.ac.una.progra4.deddrivers.bl.UsuarioBL;
import cr.ac.una.progra4.deddrivers.bl.VehiculoBL;

import java.io.Serializable;
=======
import cr.ac.una.progra4.deddrivers.bl.ServicioBL;
import cr.ac.una.progra4.deddrivers.bl.UsuarioBL;
import cr.ac.una.progra4.deddrivers.bl.VehiculoBL;
import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.dao.UsuarioDAO;
import cr.ac.una.progra4.deddrivers.dao.VehiculoDAO;
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import cr.ac.una.progra4.deddrivers.domain.Usuario;
import cr.ac.una.progra4.deddrivers.domain.Vehiculo;
>>>>>>> 1408d49c7b344e8a113f9f86d6bf331768fbed59
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author chgari
 */
public class Test {
    public static void main(String arg[]){
////////////////////////////// Inicializar //////////////////////////////
    Date date = new Date();
    Set vehiculos = new HashSet(0);
    Set servicios = new HashSet(0);
    Byte b0 = 0;
    Byte b1 = 1;
    
    Chofer c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "daniel", date, vehiculos); 
    Usuario u = new Usuario("User123", "123", "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","daniel", date, servicios);
    Vehiculo v = new Vehiculo(123, c, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "daniel", date, servicios);
    Servicio s = new Servicio(123, u, v, null, null, date, date, 5, 2000.0f, 1, date, 5, "buen servicio", "daniel", date);

    vehiculos.add(v);
    servicios.add(s);
    
    c.setVehiculos(vehiculos);
    u.setServicios(servicios);
    v.setServicios(servicios);
    
////////////////////////////// DAOs //////////////////////////////
//    ChoferDAO cdao = new ChoferDAO();
//    UsuarioDAO udao = new UsuarioDAO();
//    VehiculoDAO vdao = new VehiculoDAO();
//    ServicioDAO sdao = new ServicioDAO();
        
<<<<<<< HEAD
////////////////////////////// BLs //////////////////////////////
//    ChoferBL cbl = new ChoferBL();
//    UsuarioBL ubl = new UsuarioBL();
//    VehiculoBL vbl = new VehiculoBL();      
//    ServicioBL sbl = new ServicioBL();
    
////////////////////////////// Save DAOs //////////////////////////////
//    cdao.save(c);
//    udao.save(u);
//    vdao.save(v);
//    sdao.save(s);
    
////////////////////////////// Merge DAOs //////////////////////////////
//    c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "merge", date, vehiculos); 
//    u = new Usuario("User123", "123", "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","merge", date, servicios);
//    v = new Vehiculo(123, c, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "merge", date, servicios);
//    s = new Servicio(123, u, v, null, null, date, date, 5, 2000.0f, 1, date, 5, "buen servicio", "merge", date);
//    
//    cdao.merge(c);
//    udao.merge(u);
//    vdao.merge(v);
//    sdao.merge(s);
    
////////////////////////////// Delete Daos//////////////////////////////
//    sdao.delete(s);
//    vdao.delete(v);
//    cdao.delete(c);
//    udao.delete(u);

////////////////////////////// Save BLs //////////////////////////////
//    cbl.save(c);
//    ubl.save(u);
//    vbl.save(v);
//    sbl.save(s);
    
////////////////////////////// Merge BLs //////////////////////////////
//    c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "merge", date, vehiculos); 
//    u = new Usuario("User123", "123", "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","merge", date, servicios);
//    v = new Vehiculo(123, c, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "merge", date, servicios);
//    s = new Servicio(123, u, v, null, null, date, date, 5, 2000.0f, 1, date, 5, "buen servicio", "merge", date);

//    cbl.merge(c);
//    ubl.merge(u);
//    vbl.merge(v);
//    sbl.merge(s);

////////////////////////////// Delete BLs//////////////////////////////
//    vbl.delete(v);
//    sbl.delete(s);
//    cbl.delete(c);
//    ubl.delete(u);

=======
        ServicioDAO sdao = new ServicioDAO();
        Servicio s1 = new Servicio();
        sdao.merge(s1);
        
        UsuarioDAO udao = new UsuarioDAO();
        Usuario u1 = new Usuario();
        udao.merge(u1);
        
        VehiculoDAO vdao = new VehiculoDAO();
        Vehiculo v1 = new Vehiculo();
        vdao.merge(v1);
        
        ChoferBL cbl = new ChoferBL();
        Chofer c2 = new Chofer();
        cbl.merge(c2);
        
        ServicioBL sbl = new ServicioBL();
        Servicio s2 = new Servicio();
        sbl.merge(s2);
        
        UsuarioBL ubl = new UsuarioBL();
        Usuario u2 = new Usuario();
        ubl.merge(u2);
        
        VehiculoBL vbl = new VehiculoBL();
        Vehiculo v2 = new Vehiculo();
        vbl.merge(v2);
>>>>>>> 1408d49c7b344e8a113f9f86d6bf331768fbed59
    }
}















