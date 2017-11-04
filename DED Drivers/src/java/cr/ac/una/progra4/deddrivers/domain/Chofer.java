package cr.ac.una.progra4.deddrivers.domain;
// Generated Oct 5, 2017 12:50:00 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Chofer generated by hbm2java
 */
public class Chofer  implements java.io.Serializable {


     private int idChofer;
     private String nombre;
     private String apellidos;
     private Date fechaNacimiento;
     private Date fechaVencimiento;
     private String tipoLicencia;
     private Byte estado;
     private Byte esClienteTransportista;
     private String ultimoUsuario;
     private Date ultimaFecha;
     private Set vehiculos = new HashSet(0);

    public Chofer() {
    }

	
    public Chofer(int idChofer) {
        this.idChofer = idChofer;
    }
    public Chofer(int idChofer, String nombre, String apellidos, Date fechaNacimiento, Date fechaVencimiento, String tipoLicencia, Byte estado, Byte esClienteTransportista, String ultimoUsuario, Date ultimaFecha, Set vehiculos) {
       this.idChofer = idChofer;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.fechaNacimiento = fechaNacimiento;
       this.fechaVencimiento = fechaVencimiento;
       this.tipoLicencia = tipoLicencia;
       this.estado = estado;
       this.esClienteTransportista = esClienteTransportista;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
       this.vehiculos = vehiculos;
    }
   
    public int getIdChofer() {
        return this.idChofer;
    }
    
    public void setIdChofer(int idChofer) {
        this.idChofer = idChofer;
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
    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }
    
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public Date getFechaVencimiento() {
        return this.fechaVencimiento;
    }
    
    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
    public String getTipoLicencia() {
        return this.tipoLicencia;
    }
    
    public void setTipoLicencia(String tipoLicencia) {
        this.tipoLicencia = tipoLicencia;
    }
    public Byte getEstado() {
        return this.estado;
    }
    
    public void setEstado(Byte estado) {
        this.estado = estado;
    }
    public Byte getEsClienteTransportista() {
        return this.esClienteTransportista;
    }
    
    public void setEsClienteTransportista(Byte esClienteTransportista) {
        this.esClienteTransportista = esClienteTransportista;
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
    public Set getVehiculos() {
        return this.vehiculos;
    }
    
    public void setVehiculos(Set vehiculos) {
        this.vehiculos = vehiculos;
    }
}

