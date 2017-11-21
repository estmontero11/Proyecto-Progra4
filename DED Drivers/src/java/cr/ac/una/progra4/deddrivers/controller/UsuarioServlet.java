/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.progra4.deddrivers.controller;

import com.google.gson.Gson;
import cr.ac.una.progra4.deddrivers.bl.UsuarioBL;
import cr.ac.una.progra4.deddrivers.domain.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class UsuarioServlet extends HttpServlet {

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
            
            Usuario usuario = new Usuario();
            
            UsuarioBL uBL= new UsuarioBL();
            
           // Thread.sleep(1000);
            
            HttpSession session = request.getSession();
            
            String accion = request.getParameter("accion");
            
            switch(accion){

                case "consultarUsuario":
                    json = new Gson().toJson(uBL.findAll(Usuario.class.getName()));
                    out.print(json);
                    break;
                    
                case "eliminarUsuario":
                        usuario.setIdUsuario(request.getParameter("idUsuario"));
                    
                        //Se elimina el objeto
                        uBL.delete(usuario);

                        //Se imprime la respuesta con el response
                        out.print("El usuario fue eliminado correctamente");
                 
                    break;
                case "consultarUsuarioById":
                    //se consulta la persona por ID
                    usuario = uBL.findByIdUser(request.getParameter("idUsuario"));
                    
                    //se pasa la informacion del objeto a formato JSON
                    json = new Gson().toJson(usuario);
                    out.print(json);
                    break;
                
                case "consultarUsuarioByName":
                    json = new Gson().toJson(uBL.findByName((request.getParameter("nameUsuario"))));
                    out.print(json);
                    break;
                
                case "agregarUsuarios":
                    
                    usuario.setIdUsuario(request.getParameter("idUsuario"));
                    usuario.setContrasena(request.getParameter("contrasena"));
                    
                    usuario.setNombre(request.getParameter("nombre"));
                    usuario.setApellidos(request.getParameter("apellidos"));
                    usuario.setCorreoElectronico(request.getParameter("correo"));
                    
                    String fechatxt = request.getParameter("fechaNacimiento");
                    DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date date = format.parse(fechatxt);
                    
                    usuario.setFechaNacimiento(date);
                    usuario.setDireccion(request.getParameter("direccion"));
                    usuario.setTelefonoTrabajo(request.getParameter("telefono"));
                    usuario.setTipoUsuario(1);
                    
                    usuario.setUltimoUsuario(request.getParameter("idUsuario"));       
                    usuario.setUltimaFecha(new Date());
                    
                    if(accion.equals("agregarUsuarios")){ //es insertar personas
                        //Se guarda el objeto
                        uBL.save(usuario);

                        //Se imprime la respuesta con el response
                        out.print("C~El usuario fue ingresada correctamente");
                        
                    }
                    case "agregarUsuarios2": case "modificarUsuario":
                    
                    usuario.setIdUsuario(request.getParameter("idUsuario"));
                    usuario.setContrasena(request.getParameter("contrasena"));
                    usuario.setTipoUsuario(Integer.parseInt(request.getParameter("tipoUsuario")));
                    
                    usuario.setNombre(request.getParameter("nombre"));
                    usuario.setApellidos(request.getParameter("apellidos"));
                    usuario.setCorreoElectronico(request.getParameter("correo"));
                    
                    String fechatxt2 = request.getParameter("fechaNacimiento");
                    DateFormat format2 = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date date2 = format2.parse(fechatxt2);
                    
                    usuario.setFechaNacimiento(date2);
                    usuario.setDireccion(request.getParameter("direccion"));
                    usuario.setTelefonoTrabajo(request.getParameter("telefono"));
                    
                    usuario.setUltimoUsuario(request.getParameter("ultimoUsuario"));  
                    usuario.setUltimaFecha(new Date());
                    
                    if(accion.equals("agregarUsuarios2")){ //es insertar personas
                        //Se guarda el objeto
                        uBL.save(usuario);

                        //Se imprime la respuesta con el response
                        out.print("C~El usuario fue ingresado correctamente");
                        
                    }else{
                        uBL.merge(usuario);
                        
                        out.print("C~El usuario fue modificado correctamente");
                    }
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
