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
        <nav class="navbar navbar-default" role="navigation" > 
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Vending Machine</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-md-6" >
                    <div class="row">
                        <c:forEach var="item" items="${itemsToSell}">
                            <c:if test="${item.itemId == 1}">
                                <div class="col-sm-4" style="background-color: red">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${item.itemId == 2}">
                                <div class="col-sm-4" style="background-color: orange">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${item.itemId == 3}">
                                <div class="col-sm-4" style="background-color: red">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="row">
                        <c:forEach var="item" items="${itemsToSell}">
                            <c:if test="${item.itemId == 4}">
                                <div class="col-sm-4" style="background-color: orange">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>

                            <c:if test="${item.itemId == 5}">
                                <div class="col-sm-4" >
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>

                            <c:if test="${item.itemId == 6}">
                                <div class="col-sm-4" style="background-color: orange">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="row">
                        <c:forEach var="item" items="${itemsToSell}">
                            <c:if test="${item.itemId == 7}">
                                <div class="col-sm-4" style="background-color: lightgreen">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>

                            <c:if test="${item.itemId == 8}">

                                <div class="col-sm-4" style="background-color: yellow">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>

                            <c:if test="${item.itemId == 9}">
                                <div class="col-sm-4" style="background-color: lightgreen">
                                    <h3>${item.itemId}</h3>
                                    <h3>${item.itemName}</h3>
                                    <p>${item.itemPrice}</p>
                                    <c:if test="${item.itemQuantity < 1}">
                                        <p>Sold Out!</p>
                                    </c:if>
                                    <c:if test="${item.itemQuantity > 0}">
                                        <p>Quantity:${item.itemQuantity}</p>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="jumbotron">
                        <form class="form-horizontal" role="form" action="vendMethod" method="POST">
                            <div class="form-group">
                                <label for="userChoice" class="col-md-4 control-label">Item to buy</label>

                                <input type="number" min=1 max="9"class="form-control" name="userChoice" id="userChoice" placeholder="1-9" required='required'>

                            </div>
                            <div class="form-group">
                                <label for="userMoney" class="col-md-4 control-label">Money for purchase</label>

                                <input type="number" step=".01" min=.01 max=20 class="form-control" name="userMoney" id="userMoney" placeholder="$" required='required'>

                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-default" id="purchase-button">Purchase</button>
                            </div>

                        </form>
                    </div>
                    
                    <div class="col-md-6">
                        <c:if test="${itemNotAvailable}">
                            <p>That item is not available</p>
                            <p>Here's your $${change} back.</p>
                        </c:if>
                        <c:if test="${youCantAfford}">
                            <p>You can't afford that item.</p>
                            <p>Here's your $${change} back.</p>
                        </c:if>
                        <c:if test="${youGotItBaby}">
                            Here's your $${change} in change.
                            Enjoy your ${itemSold.itemName}.
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

