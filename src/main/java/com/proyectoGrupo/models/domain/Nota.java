/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyectoGrupo.models.domain;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Hugo Daniel Velasquez Patzan Codigo Tecnico IN5BV
 * @date 30-ago-2021
 * @time 15:09:13
 */
@Entity
@Table(name = "Nota")
@NamedQueries({
    @NamedQuery(
            name = "Nota.findAll",
            query = "from Nota"
    ),
    @NamedQuery(
            name = "Nota.find",
            query = "from Nota where id_nota = :id"
    )
})
public class Nota implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_nota")
    private int idNota;
    
    @Column(name = "nombre_actividad")
    private String nombreActividad;
    
    @Column(name = "nota_actividad")
    private int notaActividad;
    
    @Column(name = "fecha_entrega")
    private Date fechaEntrega;
    
    @Column(name = "asignacion_id")
    private int asignacionId;

    public Nota() {
    }

    public Nota(int idNota) {
        this.idNota = idNota;
    }

    public Nota(String nombreActividad, int notaActividad, Date fechaEntrega, int asignacionId) {
        this.nombreActividad = nombreActividad;
        this.notaActividad = notaActividad;
        this.fechaEntrega = fechaEntrega;
        this.asignacionId = asignacionId;
    }

    public Nota(int idNota, String nombreActividad, int notaActividad, Date fechaEntrega, int asignacionId) {
        this.idNota = idNota;
        this.nombreActividad = nombreActividad;
        this.notaActividad = notaActividad;
        this.fechaEntrega = fechaEntrega;
        this.asignacionId = asignacionId;
    }

    public int getIdNota() {
        return idNota;
    }

    public void setIdNota(int idNota) {
        this.idNota = idNota;
    }

    public String getNombreActividad() {
        return nombreActividad;
    }

    public void setNombreActividad(String nombreActividad) {
        this.nombreActividad = nombreActividad;
    }

    public int getNotaActividad() {
        return notaActividad;
    }

    public void setNotaActividad(int notaActividad) {
        this.notaActividad = notaActividad;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public int getAsignacionId() {
        return asignacionId;
    }

    public void setAsignacionId(int asignacionId) {
        this.asignacionId = asignacionId;
    }

    @Override
    public String toString() {
        return "Nota{" + "idNota=" + idNota + ", nombreActividad=" + nombreActividad + ", notaActividad=" + notaActividad + ", fechaEntrega=" + fechaEntrega + ", asignacionId=" + asignacionId + '}';
    }

}
