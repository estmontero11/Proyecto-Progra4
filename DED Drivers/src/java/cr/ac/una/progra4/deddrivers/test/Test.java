/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.test;

////////////////////////////// Clases //////////////////////////////
import cr.ac.una.progra4.deddrivers.domain.Chofer;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author chgari
 */
public class Test {
    public static void main(String arg[]){
////////////////////////////// Inicializar //////////////////////////////
    Date date = new Date();
    List vehiculos = new ArrayList(0);
    List servicios = new ArrayList(0);
    Byte b0 = 0;
    Byte b1 = 1;
    
    Chofer c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "daniel", date, vehiculos); 
    Usuario u = new Usuario("123", "123", 1, "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","daniel", date, servicios);
    Vehiculo v = new Vehiculo(123, 123, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "daniel", date, servicios);
    Servicio s = new Servicio(1 ,u, v, null, null, date, date, 5, 2000.0f, 1, date, 5, "buen servicio", "daniel", date);

   vehiculos.add(v);
    servicios.add(s);
    
    c.setVehiculos(vehiculos);
    u.setServicios(servicios);
    v.setServicios(servicios);
    
////////////////////////////// DAOs //////////////////////////////
    ChoferDAO cdao = new ChoferDAO();
    UsuarioDAO udao = new UsuarioDAO();
    VehiculoDAO vdao = new VehiculoDAO();
    ServicioDAO sdao = new ServicioDAO();
        
////////////////////////////// BLs //////////////////////////////
    ChoferBL cbl = new ChoferBL();
    UsuarioBL ubl = new UsuarioBL();
    VehiculoBL vbl = new VehiculoBL();      
    ServicioBL sbl = new ServicioBL();
    
////////////////////////////// Save DAOs //////////////////////////////
//    cdao.save(c);
//    udao.save(u);
//    vdao.save(v);
//    sdao.save(s);
    
////////////////////////////// Merge DAOs //////////////////////////////
//    c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "merge", date, vehiculos); 
//    u = new Usuario("User123", "123", "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","merge", date, servicios);
//    v = new Vehiculo(123, 123, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "merge", date, servicios);
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

////////////////////////////// FindById DAOs //////////////////////////////
//    Vehiculo vid = vdao.findById(123);
//    Servicio sid = sdao.findById(123);
//    Chofer cid = cdao.findById(123);
//    Usuario uid = udao.findById(123);

////////////////////////////// FindAll DAOs //////////////////////////////
//    List <Vehiculo> vall = vdao.findAll();
//    List <Servicio> sall = sdao.findAll();
//    List <Chofer> call = cdao.findAll();
//    List <Usuario> uall = udao.findAll();

////////////////////////////// Save BLs //////////////////////////////
//    cbl.save(c);
//    ubl.save(u);
//    vbl.save(v);
//    sbl.save(s);
    
////////////////////////////// Merge BLs //////////////////////////////
//    c = new Chofer(123, "Daniel", "Gutierrez", date, date, "A3", b1, b0, "merge", date, vehiculos); 
//    u = new Usuario("User123", "123", "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","merge", date, servicios);
//    v = new Vehiculo(123, 123, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "merge", date, servicios);
//    s = new Servicio(123, u, v, null, null, date, date, 5, 2000.0f, 1, date, 5, "buen servicio", "merge", date);

//    cbl.merge(c);
//    ubl.merge(u);
//    vbl.merge(v);
//    sbl.merge(s);

////////////////////////////// Delete BLs//////////////////////////////
    sbl.delete(s);    
    vbl.delete(v);
    ubl.delete(u);
    cbl.delete(c);

////////////////////////////// FindById BLs //////////////////////////////
//    Vehiculo vid = vbl.findById(123);
//    Servicio sid = sbl.findById(123);
//    Chofer cid = cbl.findById(123);
//    Usuario uid = ubl.findById(123);

////////////////////////////// FindAll BLs //////////////////////////////
//    List <Vehiculo> vall = vbl.findAll("cr.ac.una.progra4.deddrivers.domain.Vehiculo");
//    List <Servicio> sall = sbl.findAll("cr.ac.una.progra4.deddrivers.domain.Servicio");
//    List <Chofer> call = cbl.findAll("cr.ac.una.progra4.deddrivers.domain.Chofer");
//    List <Usuario> uall = ubl.findAll("cr.ac.una.progra4.deddrivers.domain.Usuario");
    }
}















