/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.proyectoGrupo.models.idao;
import java.util.List;
import com.proyectoGrupo.models.domain.Nota;
/**
 *
 * @author Hugo Daniel Velasquez Patzan
 * Codigo Tecnico IN5BV 
 * @date 30-ago-2021
 * @time 16:53:54
 */
public interface INotaDao {
    public List<Nota> listar();
    public Nota encontrar(Nota nota);
    public int insertar(Nota nota);
    public int actualizar(Nota nota);
    public int eliminar(Nota nota);
}
