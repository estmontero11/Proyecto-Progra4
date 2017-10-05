package cr.ac.una.progra4.deddrivers.domain;
// Generated Oct 5, 2017 12:50:00 AM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.Date;

/**
 * Servicio generated by hbm2java
 */
public class Servicio  implements java.io.Serializable {


     private int idServicio;
     private Usuario usuario;
     private Vehiculo vehiculo;
     private Serializable puntoLlegada;
     private Serializable puntoSalida;
     private Date horaLlegada;
     private Date horaSalida;
     private int duracion;
     private Float costo;
     private int idRetroalimentacion;
     private Date fechaRealizado;
     private Integer puntuacion;
     private String comentario;
     private String ultimoUsuario;
     private Date ultimaFecha;

    public Servicio() {
    }

	
    public Servicio(int idServicio, Usuario usuario, Vehiculo vehiculo, int duracion, int idRetroalimentacion) {
        this.idServicio = idServicio;
        this.usuario = usuario;
        this.vehiculo = vehiculo;
        this.duracion = duracion;
        this.idRetroalimentacion = idRetroalimentacion;
    }
    public Servicio(int idServicio, Usuario usuario, Vehiculo vehiculo, Serializable puntoLlegada, Serializable puntoSalida, Date horaLlegada, Date horaSalida, int duracion, Float costo, int idRetroalimentacion, Date fechaRealizado, Integer puntuacion, String comentario, String ultimoUsuario, Date ultimaFecha) {
       this.idServicio = idServicio;
       this.usuario = usuario;
       this.vehiculo = vehiculo;
       this.puntoLlegada = puntoLlegada;
       this.puntoSalida = puntoSalida;
       this.horaLlegada = horaLlegada;
       this.horaSalida = horaSalida;
       this.duracion = duracion;
       this.costo = costo;
       this.idRetroalimentacion = idRetroalimentacion;
       this.fechaRealizado = fechaRealizado;
       this.puntuacion = puntuacion;
       this.comentario = comentario;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
    }
   
    public int getIdServicio() {
        return this.idServicio;
    }
    
    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Vehiculo getVehiculo() {
        return this.vehiculo;
    }
    
    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
    public Serializable getPuntoLlegada() {
        return this.puntoLlegada;
    }
    
    public void setPuntoLlegada(Serializable puntoLlegada) {
        this.puntoLlegada = puntoLlegada;
    }
    public Serializable getPuntoSalida() {
        return this.puntoSalida;
    }
    
    public void setPuntoSalida(Serializable puntoSalida) {
        this.puntoSalida = puntoSalida;
    }
    public Date getHoraLlegada() {
        return this.horaLlegada;
    }
    
    public void setHoraLlegada(Date horaLlegada) {
        this.horaLlegada = horaLlegada;
    }
    public Date getHoraSalida() {
        return this.horaSalida;
    }
    
    public void setHoraSalida(Date horaSalida) {
        this.horaSalida = horaSalida;
    }
    public int getDuracion() {
        return this.duracion;
    }
    
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    public Float getCosto() {
        return this.costo;
    }
    
    public void setCosto(Float costo) {
        this.costo = costo;
    }
    public int getIdRetroalimentacion() {
        return this.idRetroalimentacion;
    }
    
    public void setIdRetroalimentacion(int idRetroalimentacion) {
        this.idRetroalimentacion = idRetroalimentacion;
    }
    public Date getFechaRealizado() {
        return this.fechaRealizado;
    }
    
    public void setFechaRealizado(Date fechaRealizado) {
        this.fechaRealizado = fechaRealizado;
    }
    public Integer getPuntuacion() {
        return this.puntuacion;
    }
    
    public void setPuntuacion(Integer puntuacion) {
        this.puntuacion = puntuacion;
    }
    public String getComentario() {
        return this.comentario;
    }
    
    public void setComentario(String comentario) {
        this.comentario = comentario;
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




}


