<%-- 
    Document   : editar-notas
    Created on : 17-sep-2021, 7:58:23
    Author     : Hugo Daniel Velasquez Patzan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
        <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>

        <title>Editar Notas</title>
    </head>

    <body style="background: #1A5276">
        <header id="main-header" class="py-2 bg-light pt-4" >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center"><i class="fas fa-tasks"></i> Editar Notas</h1>
                    </div>
                </div>
            </div>
        </header>

        <jsp:include page="../WEB-INF/paginas/comunes/cabecera_1.jsp"/>

        <section id="acciones" class="py-4 mb-4" >
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <a href="${pageContext.request.contextPath}/ServletNota?accion=listar" class="btn btn-outline-warning" >
                            <i class="fa fa-arrow-left"></i> Regresar a Notas
                        </a>
                    </div>
                </div>
            </div>
        </section>


        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header " style="background-color: #5AA8DB">
                                <h4><i class="far fa-edit"></i> Editar Notas <i class="far fa-edit"></i></h4>
                            </div>  
                            <div class="card-body " style="background-color: #F2F3F4;border-color: #DEE2E6">
                                <form  method="POST" action="${pageContext.request.contextPath}/ServletNota">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="nombreActividad" class="form-label" >Nombre Actividad:</label>
                                            <input type="text" id="nombreActividad" name="nombreActividad" class="form-control" style="background-color: #E6E7E8;border-color: #DEE2E6 " value="${nota.nombreActividad}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="notaActividad" class="form-label" >Nota Actividad:</label>
                                            <input type="number" id="notaActividad" name="notaActividad" class="form-control" style="background-color: #E6E7E8;border-color: #DEE2E6 " value="${nota.notaActividad}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="fechaEntrega" class="form-label" >Fecha de entrega:</label>
                                            <input type="date" id="fechaEntrega" name="fechaEntrega" class="form-control" style="background-color: #E6E7E8;border-color: #DEE2E6 " value="${nota.fechaEntrega}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="asignacionId" class="form-label">Id asignacion</label>
                                            <input type="number" id="asignacionId" name="asignacionId" class="form-control"  style="background-color: #E6E7E8;border-color: #DEE2E6 " value="${nota.asignacionId}">
                                        </div>




                                        <input type="hidden" name="idNota" value="${nota.idNota}">
                                        <input type="hidden" name="accion" value="actualizar">



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
                </div>
            </div>
        </main>

        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>
    </body>
</html>  