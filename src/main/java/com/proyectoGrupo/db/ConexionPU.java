/*
 * Copyright (C) 2021 Jorge Luis Pérez Canto
 */


package com.proyectoGrupo.db;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author Denil Parada <george.jlpc@gmail.com>
 * @date Sep 16, 2021
 * @time 10:59:42 AM
 */

public class ConexionPU {
    private static final String PERSISTENCE_UNIT_NAME = "ControlAcademicoPU";
    private EntityManager entityManager;
    private static ConexionPU instancia;
    
    private ConexionPU() {
        try {
            entityManager = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME).createEntityManager();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
    }
    
    public static ConexionPU getInstance() {
        if (instancia == null) {
            instancia = new ConexionPU();
        }
        return instancia;
    }
    
    public EntityManager getEntityManager() {
        return entityManager;
    }
}
