package com.proyectoGrupo.models.dao;

import com.proyectoGrupo.db.Conexion;
import com.proyectoGrupo.models.domain.Nota;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.proyectoGrupo.models.idao.INotaDao;
import java.sql.Date;

/**
 * --add-modules javafx.controls,javafx.fxml
 *
 * @author Denil José Parada Cabrera
 * @date 19/08/2021
 * @time 05:30:48 PM
 * @codigoTecnico: IN5BV
 */
public class NotaDaoImpl implements INotaDao {

    private static final String SQL_SELLECT = "select id_nota, nombre_actividad,nota_actividad,fecha_entrega,asignacion_id from Nota;";
    private static final String SQL_INSERT = "insert into Nota (nombre_actividad, nota_actividad, fecha_entrega, asignacion_id) VALUES (?,?,?,?);";
    private static final String SQL_SELLECT__STRING_BY_ID = "select id_nota, nombre_actividad,nota_actividad,fecha_entrega,asignacion_id from Nota where id_nota = ?";
    private static final String SQL_UPDATE = "UPDATE Nota SET nombre_actividad = ?, nota_actividad = ?, fecha_entrega = ?, asignacion_id = ? WHERE id_nota = ?";
    private static final String SQL_DELETE = "delete from Nota where id_nota = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Nota nota = null;
    List<Nota> ListaNota = new ArrayList<>();

    @Override
    public List<Nota> listar() {

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELLECT);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int idNota = rs.getInt("id_nota");
                String nombreActividad = rs.getString("nombre_actividad");
                int notaActividad = rs.getInt("nota_actividad");
                Date fechaEntrega = rs.getDate("fecha_entrega");
                int asignacionId = rs.getInt("asignacion_id");

                nota = new Nota(idNota, nombreActividad, notaActividad, fechaEntrega, asignacionId);
                ListaNota.add(nota);

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            System.out.println("ecepcion de tipo sql");

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return ListaNota;
    }

    @Override
    public Nota encontrar(Nota nota) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELLECT__STRING_BY_ID);
            pstmt.setInt(1, nota.getIdNota());
            pstmt.toString();

            rs = pstmt.executeQuery();

            while (rs.next()) {
                String nombreActividad = rs.getString("nombre_actividad");
                int notaActividad = rs.getInt("nota_actividad");
                Date fechaEntrega = rs.getDate("fecha_Entrega");
                int asignacionId = rs.getInt("asignacion_Id");

                nota.setNombreActividad(nombreActividad);
                nota.setNotaActividad(notaActividad);
                nota.setFechaEntrega(fechaEntrega);
                nota.setAsignacionId(asignacionId);

                ListaNota.add(nota);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return nota;
    }

    @Override
    public int insertar(Nota nota) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1, nota.getNombreActividad());
            pstmt.setInt(2, nota.getNotaActividad());
            pstmt.setDate(3, nota.getFechaEntrega());
            pstmt.setInt(4, nota.getAsignacionId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);

        }
        return rows;
    }

    @Override
    public int actualizar(Nota nota) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, nota.getNombreActividad());
            pstmt.setInt(2, nota.getNotaActividad());
            pstmt.setDate(3, nota.getFechaEntrega());
            pstmt.setInt(4, nota.getAsignacionId());
            pstmt.setInt(5, nota.getAsignacionId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);

        }
        return rows;
    }

    @Override
    public int eliminar(Nota nota) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
