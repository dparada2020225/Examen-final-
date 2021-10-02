package com.proyectoGrupo.models.dao;

import com.proyectoGrupo.db.ConexionPU;
import com.proyectoGrupo.models.domain.Nota;
import com.proyectoGrupo.models.idao.INotaDao;
import java.util.List;

/**
 * --add-modules javafx.controls,javafx.fxml
 *
 * @author Denil José Parada Cabrera
 * @date 1/10/2021
 * @time 05:54:41 PM
 * @codigoTecnico: IN5BV
 */
public class NotaDaoJPA implements INotaDao {

    private ConexionPU conn = ConexionPU.getInstance();

    @Override
    public List<Nota> listar() {
        return conn.getEntityManager().createNamedQuery("Nota.findAll").getResultList();
    }

    @Override
    public Nota encontrar(Nota nota) {
        return (Nota) conn.getEntityManager().createNamedQuery("Nota.find").setParameter("id", nota.getIdNota()).getSingleResult();
    }

    @Override
    public int insertar(Nota nota) {
        int row = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().persist(nota);
            conn.getEntityManager().getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return row;
    }

    @Override
    public int actualizar(Nota nota) {
        int row = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().merge(nota);
            conn.getEntityManager().getTransaction().commit();
            row = 1;
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return row;
    }

    @Override
    public int eliminar(Nota nota) {
        int row = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().remove(nota);
            conn.getEntityManager().getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return row;
    }

}
