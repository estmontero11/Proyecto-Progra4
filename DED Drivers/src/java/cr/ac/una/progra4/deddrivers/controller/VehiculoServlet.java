/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.controller;

import com.google.gson.Gson;
import cr.ac.una.progra4.deddrivers.bl.VehiculoBL;
import cr.ac.una.progra4.deddrivers.domain.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VehiculoServlet extends HttpServlet{
  /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //String para guardar el JSON generaro por al libreria GSON
            String json;
            
            //Se crea el objeto Chofer
            Vehiculo c = new Vehiculo();

            //Se crea el objeto de la logica de negocio
            VehiculoBL cBL = new VehiculoBL();
            
            
            //**********************************************************************
            //se toman los datos de la session
            //**********************************************************************
            HttpSession session = request.getSession();
            
            //**********************************************************************
            //se consulta cual accion se desea realizar
            //**********************************************************************
            String accion = request.getParameter("accion");
            switch (accion) {
                case "consultarVehiculos":
                    json = new Gson().toJson(cBL.findAll(Vehiculo.class.getName()));
                    out.print(json);
                    break;
                    
                case "eliminarVehiculo":
                        c.setIdVehiculo(Integer.parseInt(request.getParameter("idVehiculo")));
                    
                        //Se elimina el objeto
                        cBL.delete(c);

                        //Se imprime la respuesta con el response
                        out.print("El Vehiculo fue eliminado correctamente");
                 
                    break;
                    
                case "consultarVehiculoById":
                    //se consulta la persona por ID
                    c = cBL.findById(Integer.parseInt(request.getParameter("idVehiculo")));
                    
                    //se pasa la informacion del objeto a formato JSON
                    json = new Gson().toJson(c);
                    out.print(json);
                    break;
                    
                case "consultarVehiculoByName":
                    //se consulta las personas por Name
                    //revisar
                    json = new Gson().toJson(cBL.findByName(Integer.parseInt(request.getParameter("nameVehiculo"))));
                    out.print(json);
                    break;
                    
                case "agregarVehiculo": case "modificarVehiculo":

                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
                    c.setIdVehiculo(Integer.parseInt(request.getParameter("idVehiculo")));
                    c.setAnno(Integer.parseInt(request.getParameter("anno")));
                    c.setModelo(request.getParameter("modelo"));
                    c.setPlaca(request.getParameter("placa"));
                    c.setColor(request.getParameter("color"));
                    c.setPuntuacion(Integer.parseInt(request.getParameter("puntuacion")));
                    c.setEstado(Byte.parseByte(request.getParameter("estado")));
                    c.setUbicacionActual(request.getParameter("ubicacionActual"));
                    c.setIdChofer(Integer.parseInt(request.getParameter("idChofer")));
                    
                    if(accion.equals("agregarVehiculo")){ //es insertar personas
                        //Se guarda el objeto
                        cBL.save(c);

                        //Se imprime la respuesta con el response
                        out.print("C~El Vehiculo fue ingresado correctamente");
                        
                    }else{//es modificar persona
                        //Se guarda el objeto
                        cBL.merge(c);

                        //Se imprime la respuesta con el response
                        out.print("C~El Vehiculo fue modificado correctamente");
                    }                 
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
            }

        } catch (NumberFormatException e) {
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
