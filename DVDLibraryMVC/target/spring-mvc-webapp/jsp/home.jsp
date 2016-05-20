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
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">
                            Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/search">
                            Search</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/stats">
                            Stats</a></li>
                </ul>    
            </div>

            <div class="row">
                <div class="col-md-12">
                    <a href="${pageContext.request.contextPath}/newDVDNoAjax" class="btn btn-success" type="button">Add DVD</a>
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

                            <h4>${dvd.title}</h4><br/>
                            Release Date: ${dvd.releaseDate}<br/>
                            Rating: ${dvd.rating}<br/>
                            Director: ${dvd.director}<br/>
                            Studio: ${dvd.studio}<br/>
                            User Rating: ${dvd.userRating}<br/>
                            <p>
                                <a href="${editDVD_url}">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>&nbsp;
                                <a href="${deleteDVD_url}">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
