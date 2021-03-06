package com.proyectoGrupo.controller;

import com.proyectoGrupo.db.Conexion;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.util.List;
import com.proyectoGrupo.models.dao.NotaDaoImpl;
import com.proyectoGrupo.models.dao.NotaDaoJPA;
import com.proyectoGrupo.models.domain.Nota;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * --add-modules javafx.controls,javafx.fxml
 *
 * @author Denil José Parada Cabrera
 * @date 25/08/2021
 * @time 11:40:37 PM
 * @codigoTecnico: IN5BV
 */
@WebServlet("/ServletNota")
public class ServletNota extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        System.out.println("\ndoPost");
        String accion = request.getParameter("accion");
        System.out.println("accion: " + accion);

        if (accion != null) {

            switch (accion) {

                case "insertar":
                   insertarNotas(request, response);
                    break;
                case "actualizar": 
                    actualizarNotas(request, response);
                    break;
            }

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        if (accion != null) {

            switch (accion) {

                case "listar":
                    listarNotas(request, response);
                    break;
                case "editar":
                    editarNotas(request, response);
                    break;
                case "eliminar":
                    EliminarNotas(request, response);
                    break;
            }

        }
    }

    private void listarNotas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //List<Nota> listarNotas = new NotaDaoImpl().listar();
        List<Nota> listarNotas = new NotaDaoJPA().listar();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoNotas", listarNotas);
        sesion.setAttribute("promedioNotas", getPromedio(listarNotas));
        sesion.setAttribute("actividadesAprobadas", getAprobados(listarNotas));
        sesion.setAttribute("actividadesReprobadas", getReprobados(listarNotas));
        response.sendRedirect("nota/listar-nota.jsp");

    }
    
    public double getPromedio(List<Nota> listarNotas) {
        double suma = 0;
        double promedio = 0;
        for (Nota notas : listarNotas) {
            suma = suma + notas.getNotaActividad();
            promedio = suma/ listarNotas.size();
        }
        return promedio;
    }
    public double getAprobados(List<Nota> listarNotas) {
        double contador = 0;
        for (Nota notas : listarNotas) {
            if (notas.getNotaActividad()>=70 ) {
                contador++;
            }
        }
        return contador;
    }
    public double getReprobados(List<Nota> listarNotas) {
        double contador = 0;
        for (Nota notas : listarNotas) {
            if (notas.getNotaActividad()<=69 ) {
                contador++;
            }
        }
        return contador;
    }
    
    private void EliminarNotas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idNota = Integer.parseInt(request.getParameter("idNota"));

        //Nota nota = new Nota(idNota);
        Nota nota = new NotaDaoJPA().encontrar(new Nota(idNota));
        
        //int registrosEliminados = new NotaDaoImpl().eliminar(nota);
        int registrosEliminados = new NotaDaoJPA().eliminar(nota);
        System.out.println("cantidad de registros eliminados: " + registrosEliminados);
        listarNotas(request, response);

    }
    
    private void editarNotas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int idNota = Integer.parseInt(request.getParameter("idNota"));

        //Nota nota = new NotaDaoImpl().encontrar(new Nota(idNota));
        Nota nota = new NotaDaoJPA().encontrar(new Nota(idNota));

        System.out.println(nota);

        request.setAttribute("nota", nota);
        request.getRequestDispatcher("nota/editar-nota.jsp").forward(request, response);
    }
    
    private void actualizarNotas(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        int idNota = Integer.parseInt(request.getParameter("idNota"));
        System.out.println(idNota);
        String nombreActividad = request.getParameter("nombreActividad");
        System.out.println(nombreActividad);
        int notaActividad = Integer.parseInt(request.getParameter("notaActividad"));
        System.out.println(notaActividad);
        Date fechaEntrega = Date.valueOf(request.getParameter("fechaEntrega"));
        System.out.println(fechaEntrega);
        int asignacionId = Integer.parseInt(request.getParameter("asignacionId"));
        System.out.println(asignacionId);

        Nota nota = new Nota(idNota, nombreActividad, notaActividad, fechaEntrega, asignacionId);
        System.out.println(nota);
        //int registrosActualizados = new NotaDaoImpl().actualizar(nota);
        int registrosActualizados = new NotaDaoJPA().actualizar(nota);
        listarNotas(request, response);
    }
    

    private void insertarNotas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String nombreActividad = request.getParameter("nombreActividad");
        int notaActividad = Integer.parseInt(request.getParameter("notaActividad"));
        Date fechaEntrega = Date.valueOf(request.getParameter("fechaEntrega"));
        int asignacionId = Integer.parseInt(request.getParameter("asignacionId"));

        Nota nota = new Nota(nombreActividad, notaActividad, fechaEntrega, asignacionId);
        System.out.println(nota);

        //insertar 
        //int registrosIngresados = new NotaDaoImpl().insertar(nota);
        int registrosIngresados = new NotaDaoJPA().insertar(nota);
        System.out.println("registros ingresados:" + registrosIngresados);
        listarNotas(request, response);
        
    }

    

}