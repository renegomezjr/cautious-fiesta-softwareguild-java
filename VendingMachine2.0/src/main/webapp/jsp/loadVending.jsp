<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>Spring MVC Application from Archetype</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
   <!--                <li role="presentation"><a href="${pageContext.request.contextPath}/hello/sayhi">Hello Controller</a></li>-->
                </ul>    
            </div>

            <div class="row">
                <div class="col-md-6">
                    <c:forEach var="item" items="${itemsToSell}">
                        <p>${item.itemName}</p>
                        <p>${item.itemPrice}</p>
                        <p>${item.itemQuantity}</p>
                        <hr>
                    </c:forEach>
                </div>

                <div class="col-md-6">
                    <form class="form-horizontal" role="form" action="vendMethod" method="POST">
                        <div class="form-group">
                            <label for="userChoice" class="col-md-4 control-label">Item to buy</label>

                            <input type="number" min=1 max="9"class="form-control" name="userChoice" id="userChoice" placeholder="1-9">

                        </div>
                        <div class="form-group">
                            <label for="userMoney" class="col-md-4 control-label">Money for purchase</label>

                            <input type="number" step=".01" class="form-control" name="userMoney" id="userMoney" placeholder="$">

                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-default" id="purchase-button">Purchase</button>
                        </div>

                    </form>
                </div>

            </div>
            <div class="row">
                <div>
                    Here's your $${change}.
                    Enjoy your ${itemSold.itemName}.
                </div>

            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

