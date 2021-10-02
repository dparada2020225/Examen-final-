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
        <!-- #34495E -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
         Bootstrap CSS --> 
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>

        <title>Listado de notas</title>
    </head>
    <body class=" " style="background: #1A5276" >
        <header id="main-header" class="py-2 bg-light pt-4" >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center"><i class="fas fa-list-ul"></i> Notas</h1>
                    </div>
                </div>
            </div>
        </header>

        <jsp:include page="../WEB-INF/paginas/comunes/cabecera_1.jsp"/>

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
                <div class="modal-content " style="background-color: #F2F3F4;border-color: #DEE2E6">
                    <div class="modal-header "style="background-color: #5AA8DB">
                        <h5 class="modal-title" id="exampleModalLabel"> <i class="fas fa-plus"></i> Agregar estudiante <i class="fas fa-plus"></i></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletNota">
                        <div class="modal-body" style="background-color: #F2F3F4;border-color: #DEE2E6">
                            <div class="mb-3">
                                <label for="nombreActividad" class="form-label">Nombre Actividad:</label>
                                <input type="text" id="nombreActividad" name="nombreActividad" style="background-color: #E6E7E8;border-color: #DEE2E6 " class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="notaActividad" class="form-label" >Nota Actividad:</label>
                                <input type="number" id="notaActividad" name="notaActividad" style="background-color: #E6E7E8;border-color: #DEE2E6 " class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="fechaEntrega" class="form-label" >Fecha de entrega:</label>
                                <input type="date" id="fechaEntrega" name="fechaEntrega" style="background-color: #E6E7E8;border-color: #DEE2E6 " class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="asignacionId" class="form-label">Id asignacion</label>
                                <input type="number" id="asignacionId" name="asignacionId" style="background-color: #E6E7E8;border-color: #DEE2E6 " class="form-control">
                            </div>

                            <input type="hidden" name="accion" value="insertar">
                        </div>
                        <div class="modal-footer" style="background: #CFF4FC; border-color: black">
                            <a href="${pageContext.request.contextPath}/ServletNota?accion=listar" class="btn btn-danger   btn-block">
                                Cancelar
                            </a>
                            <button type="submit" class="btn btn-success">Guardar</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <section id="estudiantes" class="mb-5 m4-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-12">


                        <div class="card " style="background-color: #5DADE2">
                            <div class="card-header">
                                <h4><i class="fas fa-book-open "></i> Listado de Notas <i class="fas fa-book-open"></i></h4>  
                            </div>
                        </div>

                        <table class="table  table-striped col-12 col-md-12" style="background-color: #F2F3F4 " > 
                            <thead class="table-info">
                                <tr>
                                    <th><i class="far fa-clipboard"></i> #</th>
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
                                        <td><i class="far fa-clipboard"></i> ${nota.idNota}</td>
                                        <td>${nota.nombreActividad}</td>
                                        <td>${nota.notaActividad}</td>
                                        <td>${nota.fechaEntrega}</td>
                                        <td class="">${nota.asignacionId}</td>

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
                            <div class="card text-center text-white mb-3" style="background-color: #3383FF">
                                <div class="card-body">
                                    <h3>Promedio de notas</h3>
                                    <h4 class="display-4">
                                        <i class="far fa-star"></i> ${promedioNotas}
                                    </h4>
                                </div> 
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-md-3 m-auto mt-4" >

                        <div class="row pb-5">
                            <div class="card text-center text-white mb-3" style="background-color: #22DF2B">
                                <div class="card-body">
                                    <h3>Act. Aprobadas</h3>
                                    <h4 class="display-4">
                                        <i class="far fa-smile"></i> ${actividadesAprobadas}
                                    </h4>
                                </div> 
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-md-3 m-auto mt-4" >

                        <div class="row pb-5">
                            <div class="card text-center text-white mb-3" style="background-color: #FF3333">
                                <div class="card-body">
                                    <h3>Act. Reprobadas</h3>
                                    <h4 class="display-4">
                                        <i class="far fa-frown"></i> ${actividadesReprobadas}
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
    <jsp:include page="../WEB-INF/paginas/comunes/pie-pagina_1.jsp"/>

</html>  