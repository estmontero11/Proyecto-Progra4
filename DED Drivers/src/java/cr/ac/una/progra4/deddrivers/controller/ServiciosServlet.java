/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.controller;

import com.google.gson.Gson;
import cr.ac.una.progra4.deddrivers.bl.ServicioBL;
import cr.ac.una.progra4.deddrivers.bl.VehiculoBL;
import cr.ac.una.progra4.deddrivers.domain.Chofer;
import cr.ac.una.progra4.deddrivers.domain.Servicio;
import cr.ac.una.progra4.deddrivers.domain.Usuario;
import cr.ac.una.progra4.deddrivers.domain.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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

            Servicio s = new Servicio();
            ServicioBL sBL= new ServicioBL();
            VehiculoBL vBL = new VehiculoBL();
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            String paginaDestino = "";
            //String opcion = req.getParameter("opcion");
            switch (accion) {
                case "guardarServicio":
                    s.setPuntoSalida(request.getParameter("salida"));
                    s.setPuntoLlegada(request.getParameter("llegada"));
                    
                    String horaSalida = request.getParameter("horaSalida");
                    DateFormat formatoSalida = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
                    Date dateSalida = formatoSalida.parse(horaSalida);
                    s.setHoraSalida(dateSalida);
                    
                    String horaLlegada = request.getParameter("horaLlegada");
                    DateFormat formatoLlegada = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
                    Date dateLlegada = formatoLlegada.parse(horaLlegada);
                    s.setHoraSalida(dateLlegada);
                    
                    s.setDuracion(Integer.parseInt(request.getParameter("duracion")));
                    
                    String fecha = request.getParameter("fechaRealizado");
                    DateFormat formatFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date dateFecha = formatFecha.parse(fecha);
                    s.setFechaRealizado(dateFecha);
                    
                    s.setPuntuacion(Integer.parseInt(request.getParameter("puntuacion")));
                    s.setCosto(Float.parseFloat(request.getParameter("precio")));
                    s.setComentario(request.getParameter("comentario"));
                    s.setUltimoUsuario(request.getParameter("ultimoUsuario"));
                    s.setUltimaFecha(new Date());
                    sBL.save(s);
                    
                    break;
                case "consultarVehiculoLibre":
                    json = new Gson().toJson(vBL.findActivos());
                    out.print(json);
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
