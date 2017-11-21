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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chgari
 */
public class LoginServlet extends HttpServlet {

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
            
            //Thread.sleep(1000);
            
            //**********************************************************************
            //se consulta cual accion se desea realizar
            //**********************************************************************
            String accion = request.getParameter("accion");
            switch (accion) {
                case "comprobarUsuario":
                    String user = request.getParameter("idUsuario");
                    String password =request.getParameter("contrasena");
                    //se consulta la persona por ID
                    usuario = uBL.findByIdUser(user);
                    if(usuario != null){          
                        if(usuario.getContrasena() == null ? password == null : usuario.getContrasena().equals(password)){
                            HttpSession session=request.getSession(true); 
                            session.setAttribute("usuario", user); 
                            session.setAttribute("loginStatus", "login"); 
                            if (usuario.getTipoUsuario() == 0) {
                                session.setAttribute("tipo", "Administrador"); 
                            }else{
                                session.setAttribute("tipo", "Normal"); 
                            }
                            out.print("C~Validación correcta... espere esta siendo redireccionado");
                        }else{
                            out.print("E~Contraseña invalida");
                        }
                        break;
                    }else{
                        out.print("E~El usuario con el que intenta ingresar no existe");
                        break;
                    }
   
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