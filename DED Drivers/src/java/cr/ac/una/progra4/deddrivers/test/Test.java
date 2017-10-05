/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.test;

import cr.ac.una.progra4.deddrivers.bl.ChoferBL;
import cr.ac.una.progra4.deddrivers.dao.ChoferDAO;
import cr.ac.una.progra4.deddrivers.domain.Chofer;
import cr.ac.una.progra4.deddrivers.bl.ServicioBL;
import cr.ac.una.progra4.deddrivers.dao.ServicioDAO;
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import java.util.Date;

/**
 *
 * @author chgari
 */
public class Test {
    public static void main(String arg[]){
        ChoferDAO cdao = new ChoferDAO();
        Chofer c1 = new Chofer();
        cdao.merge(c1);
        
        ServicioDAO sdao = new ServicioDAO();
        Servicio s1 = new Servicio();
        sdao.merge(s1);
        
        ChoferBL cbl = new ChoferBL();
        Chofer c2 = new Chofer();
        cbl.merge(c2);
        
        ServicioBL sbl = new ServicioBL();
        Servicio s2 = new Servicio();
        sbl.merge(s2);
    }
}















