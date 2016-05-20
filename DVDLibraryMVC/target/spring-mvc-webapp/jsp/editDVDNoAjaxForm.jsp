<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DVD Library</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1>DVD Library</h1>
                </div>
            </div>
            <hr>

            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/">
                            Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/search">
                            Search</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/stats">
                            Stats</a></li>
                </ul>    
            </div>
                
            <div class="row">
                <div class="col-md-12">
                    <h3>Edit DVD info</h3>
                    <p>Please complete as much info as possible</p>
                </div>
            </div>

            <div class="row">
                <sf:form class="form-horizontal" role="form" action="editDVDNoAjaxMethod"
                      method="POST" modelAttribute="dvdToEdit">

                    <div class="form-group">
                        <label for="edit-title" class="col-md-4 control-label">Title:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="edit-title" 
                                   path="title" placeholder="Title"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-releaseDate" class="col-md-4 control-label">Release Date:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="add-releaseDate" 
                                   path="releaseDate" placeholder="2000-12-28"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-rating" class="col-md-4 control-label">Mpaa Rating:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="add-rating" 
                                   path="rating" placeholder="R, PG-13, PG, G"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-director" class="col-md-4 control-label">Director:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="add-director" 
                                   path="director" placeholder="Director"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-studio" class="col-md-4 control-label">Studio:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="add-studio" 
                                   path="studio" placeholder="Studio"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-userRating" class="col-md-4 control-label">User Rating:</label>
                        <div class="col-md-4">
                            <sf:input type="text" class="form-control" id="add-userRating" 
                                   path="userRating" placeholder="User Rating"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <sf:hidden path="dvdId"/>
                        <div class="col-md-offset-4 col-md-4">
                            <button type="submit" id="add-button" class="btn btn-success">save DVD</button>
                        </div>
                    </div>
                </sf:form>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
