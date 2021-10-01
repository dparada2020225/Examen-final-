<%-- 
    Document   : estudiante
    Created on : 26/08/2021, 12:42:19 AM
    Author     : Denil José Parada Cabrera 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
         Bootstrap CSS --> 
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>

        <title>Listado de notas</title>
    </head>
    <body>
        <header id="main-header" class="py-2 bg-light pt-4">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center">Notas</h1>
                    </div>
                </div>
            </div>
        </header>

        <jsp:include page="../WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id="main-header" class="py-2 bg-light pt-4">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>
                            <i class="fas fa-cog"> </i> Control Notas  <i class="fas fa-cog"> </i>
                        </h1>
                    </div>
                </div>
            </div>
        </header>


        <section id="acciones" class="py-4 mb-4" >
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <a class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#agregar-salon-modal">
                            <i class="fas fa-plus"></i> Agregar Nota
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal -->
        <div class="modal fade" id="agregar-salon-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title bg-primary" id="exampleModalLabel">Agregar estudiante</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletNota">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="nombreActividad" class="form-label">Nombre Actividad:</label>
                                <input type="text" id="nombreActividad" name="nombreActividad" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="notaActividad" class="form-label" >Nota Actividad:</label>
                                <input type="number" id="notaActividad" name="notaActividad" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="fechaEntrega" class="form-label" >Fecha de entrega:</label>
                                <input type="date" id="fechaEntrega" name="fechaEntrega" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="asignacionId" class="form-label">Id asignacion</label>
                                <input type="number" id="asignacionId" name="asignacionId" class="form-control">
                            </div>

                            <input type="hidden" name="accion" value="insertar">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Calcelar</button>
                            <button type="submit" class="btn btn-success">Guardar</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <section id="estudiantes" class="mb-5 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-12">


                        <div class="card">
                            <div class="card-header">
                                <h4> <i class="fas fa-school"></i> Listado de Notas <i class="fas fa-school"></i> </h4>
                            </div>
                        </div>

                        <table class="table table-striped "> 
                            <thead class="table-primary">
                                <tr>
                                    <th> <i class="fas fa-book-open"></i> #</th>
                                    <th>Nombre actividad</th>
                                    <th>Nota</th>
                                    <th>fecha entrega</th>
                                    <th>id asignacion</th>
                                    <th></th> 
                                    <th></th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="nota" items="${listadoNotas}">
                                    <tr>
                                        <td>${nota.idNota}</td>
                                        <td>${nota.nombreActividad}</td>
                                        <td>${nota.notaActividad}</td>
                                        <td>${nota.fechaEntrega}</td>
                                        <td>${nota.asignacionId}</td>

                                        <td>
                                            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/ServletNota?accion=editar&idNota=${nota.idNota}">
                                                <i class="fas fa-user-edit"></i> Editar
                                            </a>
                                        </td> 

                                        <td>
                                            <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/ServletNota?accion=eliminar&idNota=${nota.idNota}">
                                                <i class="fas fa-trash-alt"></i> Eliminar
                                            </a>
                                        </td> 
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>    
                    </div>
                    <div class="col-12 col-md-3 m-auto mt-4" >

                        <div class="row pb-5">
                            <div class="card text-center bg-warning text-white mb-3">
                                <div class="card-body">
                                    <h3>Promedio de notas</h3>
                                    <h4 class="display-4">
                                        <i class="fas fa-users"></i> ${promedioNotas}
                                    </h4>
                                </div> 
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-md-3 m-auto mt-4" >

                        <div class="row pb-5">
                            <div class="card text-center bg-warning text-white mb-3">
                                <div class="card-body">
                                    <h3>Actividades Aprobadas</h3>
                                    <h4 class="display-4">
                                        <i class="fas fa-users"></i> ${actividadesAprobadas}
                                    </h4>
                                </div> 
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-md-3 m-auto mt-4" >

                        <div class="row pb-5">
                            <div class="card text-center bg-warning text-white mb-3">
                                <div class="card-body">
                                    <h3>Actividades Reprobadas</h3>
                                    <h4 class="display-4">
                                        <i class="fas fa-users"></i> ${actividadesReprobadas}
                                    </h4>
                                </div> 
                            </div>

                        </div>
                    </div>


                </div>
            </div>

        </section>




        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>  