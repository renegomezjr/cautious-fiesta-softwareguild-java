<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/search">
                            Search</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/stats">
                            Stats</a></li>
                </ul>    
            </div>

            <div class="row">
                <div class="col-md-12">
                    <h3>Search for DVD</h3>
                </div>
            </div>

            <div class="row">
                <form class="form-horizontal" role="form" action="search"
                      method="POST">

                    <div class="form-group">
                        <label for="search-title" class="col-md-4 control-label">Title:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-title" 
                                   name="title" placeholder="Title"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="search-releaseDate" class="col-md-4 control-label">Release Date:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-releaseDate" 
                                   name="releaseDate" placeholder="2000-12-28"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="search-rating" class="col-md-4 control-label">Mpaa Rating:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-rating" 
                                   name="rating" placeholder="R, PG-13, PG, G"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="search-director" class="col-md-4 control-label">Director:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-director" 
                                   name="director" placeholder="Director"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="search-studio" class="col-md-4 control-label">Studio:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-studio" 
                                   name="studio" placeholder="Studio"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="search-userRating" class="col-md-4 control-label">User Rating:</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="search-userRating" 
                                   name="userRating" placeholder="User Rating"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-4">
                            <button type="submit" id="add-button" class="btn btn-success">search for DVD</button>
                        </div>
                    </div>
                </form>

                <div class="row">
                    <div class="col-md-12">
                        <c:if test="${fromSearch}">
                            <h3>Here are the results of your search</h3>
                            <c:if test="${listSize < 1}">
                                <p>No results found.</p>
                            </c:if>
                        </c:if>
                    </div>
                </div>
                
                <div class="row">
                    <c:forEach var="dvd" items="${dvdList}">
                        <div class="col-md-4">
                            <div class="jumbotron">
                                <s:url value="editDVDNoAjax" var="editDVD_url">
                                    <s:param name="dvdId" value="${dvd.dvdId}"/>
                                </s:url>
                                <s:url value="deleteDVDNoAjax" var="deleteDVD_url">
                                    <s:param name="dvdId" value="${dvd.dvdId}"/>
                                </s:url>

                                <h4>${dvd.title}<a href="${editDVD_url}"></h4>
                                <span class="glyphicon glyphicon-pencil"></span>
                                </a><br/>
                                Release Date: ${dvd.releaseDate}<br/>
                                Rating: ${dvd.rating}<br/>
                                Director: ${dvd.director}<br/>
                                Studio: ${dvd.studio}<br/>
                                User Rating: ${dvd.userRating}<br/>
                                <a href="${deleteDVD_url}">
                                    <span class="glyphicon glyphicon-remove"></span></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
