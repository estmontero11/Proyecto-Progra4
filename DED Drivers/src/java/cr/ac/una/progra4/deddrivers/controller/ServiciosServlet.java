/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.controller;

import cr.ac.una.progra4.deddrivers.bl.ServicioBL;
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import cr.ac.una.progra4.deddrivers.domain.Usuario;
import cr.ac.una.progra4.deddrivers.domain.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Daniel
 */
public class ServiciosServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
 
            String json;
            
            Date date= new Date();
            List vehiculos = new ArrayList(0);
            List servicios = new ArrayList(0);
            Byte b0 = 0;
            Byte b1 = 1;
            Usuario u = new Usuario("123", "123", 1, "Daniel", "Gutierrez", "prueba@gmail.com", date, "Barva", "8123-4567","daniel", date, servicios);
            Vehiculo v = new Vehiculo(123, 123, 2017, "Toyota Yaris", "ABC-123", "azul", 5, b1, "Lagunilla", "daniel", date, servicios);
            Serializable s1 = null;
            Serializable s2= null;
            Date h1= new Date();
            Date h2= new Date();
            int duracion=1;
            float costo=1;
            Date fecha= new Date();
            Usuario u2= new Usuario();
            int idServicio=1;

            Servicio s= new Servicio();
            ServicioBL sBL= new ServicioBL();
            
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            
            switch (accion) {
                case "agregarRetro":
                    s.setIdServicio(idServicio);
                    s.setUsuario(u);
                    s.setVehiculo(v);
                    s.setPuntoLlegada(s1);
                    s.setPuntoSalida(s2);
                    s.setHoraLlegada(h1);
                    s.setHoraSalida(h2);
                    s.setDuracion(duracion);
                    s.setCosto(costo);
                    s.setIdRetroalimentacion(Integer.parseInt(request.getParameter("idRetro")));
                    s.setPuntuacion(Integer.parseInt(request.getParameter("puntuacion")));
                    s.setComentario(request.getParameter("comentario"));
                    s.setUltimoUsuario("amigo");
                    s.setUltimaFecha(fecha);
                    
                    if (accion.equals("agregarRetro")) {
                        sBL.save(s);

                        out.print("C~La retroalimentación fue ingresada correctamente");
                    }


                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
            }
           
        }catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
