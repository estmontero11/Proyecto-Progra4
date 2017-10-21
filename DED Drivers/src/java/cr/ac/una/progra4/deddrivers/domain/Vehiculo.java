package cr.ac.una.progra4.deddrivers.domain;
// Generated Oct 5, 2017 12:50:00 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Vehiculo generated by hbm2java
 */
public class Vehiculo  implements java.io.Serializable {


     private int idVehiculo;
     private int idChofer;
     private int anno;
     private String modelo;
     private String placa;
     private String color;
     private int puntuacion;
     private Byte estado;
     private String ubicacionActual;
     private String ultimoUsuario;
     private Date ultimaFecha;
     private Set servicios = new HashSet(0);

    public Vehiculo() {
    }

	
    public Vehiculo(int idVehiculo, int idChofer, int anno, int puntuacion) {
        this.idVehiculo = idVehiculo;
        this.idChofer = idChofer;
        this.anno = anno;
        this.puntuacion = puntuacion;
    }
    public Vehiculo(int idVehiculo, int idChofer, int anno, String modelo, String placa, String color, int puntuacion, Byte estado, String ubicacionActual, String ultimoUsuario, Date ultimaFecha, Set servicios) {
       this.idVehiculo = idVehiculo;
       this.idChofer = idChofer;
       this.anno = anno;
       this.modelo = modelo;
       this.placa = placa;
       this.color = color;
       this.puntuacion = puntuacion;
       this.estado = estado;
       this.ubicacionActual = ubicacionActual;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
       this.servicios = servicios;
    }
   
    public int getIdVehiculo() {
        return this.idVehiculo;
    }
    
    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }
    public int getIdChofer() {
        return this.idChofer;
    }
    
    public void setIdChofer(int idChofer) {
        this.idChofer = idChofer;
    }
    public int getAnno() {
        return this.anno;
    }
    
    public void setAnno(int anno) {
        this.anno = anno;
    }
    public String getModelo() {
        return this.modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public String getPlaca() {
        return this.placa;
    }
    
    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }
    public int getPuntuacion() {
        return this.puntuacion;
    }
    
    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }
    public Byte getEstado() {
        return this.estado;
    }
    
    public void setEstado(Byte estado) {
        this.estado = estado;
    }
    public String getUbicacionActual() {
        return this.ubicacionActual;
    }
    
    public void setUbicacionActual(String ubicacionActual) {
        this.ubicacionActual = ubicacionActual;
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