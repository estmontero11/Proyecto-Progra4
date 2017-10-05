package cr.ac.una.progra4.deddrivers.domain;
// Generated Oct 5, 2017 12:50:00 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String idUsuario;
     private String contrasena;
     private String nombre;
     private String apellidos;
     private String correoElectronico;
     private Date fechaNacimiento;
     private String direccion;
     private String telefonoTrabajo;
     private String ultimoUsuario;
     private Date ultimaFecha;
     private Set servicios = new HashSet(0);

    public Usuario() {
    }

	
    public Usuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
    public Usuario(String idUsuario, String contrasena, String nombre, String apellidos, String correoElectronico, Date fechaNacimiento, String direccion, String telefonoTrabajo, String ultimoUsuario, Date ultimaFecha, Set servicios) {
       this.idUsuario = idUsuario;
       this.contrasena = contrasena;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.correoElectronico = correoElectronico;
       this.fechaNacimiento = fechaNacimiento;
       this.direccion = direccion;
       this.telefonoTrabajo = telefonoTrabajo;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
       this.servicios = servicios;
    }
   
    public String getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getCorreoElectronico() {
        return this.correoElectronico;
    }
    
    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }
    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }
    
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getTelefonoTrabajo() {
        return this.telefonoTrabajo;
    }
    
    public void setTelefonoTrabajo(String telefonoTrabajo) {
        this.telefonoTrabajo = telefonoTrabajo;
    }
    public String getUltimoUsuario() {
        return this.ultimoUsuario;
    }
    
    public void setUltimoUsuario(String ultimoUsuario) {
        this.ultimoUsuario = ultimoUsuario;
    }
    public Date getUltimaFecha() {
        return this.ultimaFecha;
    }
    
    public void setUltimaFecha(Date ultimaFecha) {
        this.ultimaFecha = ultimaFecha;
    }
    public Set getServicios() {
        return this.servicios;
    }
    
    public void setServicios(Set servicios) {
        this.servicios = servicios;
    }




}


