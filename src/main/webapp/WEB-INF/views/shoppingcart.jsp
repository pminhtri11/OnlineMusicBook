<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
<link
	href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<c:set var="id" value="${userid }"/>
	<c:choose>
		<c:when test="${(sessionScope.User.username != null) && sessionScope.User.id == id }">			
			<jsp:include page="userheader.jsp" />
		</c:when>
		<c:otherwise>
			<c:redirect url = "/login"/>
		</c:otherwise>
	</c:choose>
	
	<!-- Hero Section Begin -->
	<div class="breadcrumb-section">
		<img class="banner"
			src="https://www.wallpaperup.com/uploads/wallpapers/2012/09/28/16804/55ef95f4ebe4747a7f520655c0cbba7e-700.jpg">
		<div class="breadcrumb__text">
			<h2>Your Shopping Cart</h2>
			<div class="breadcrumb__option text-center">
				<a href="<c:url value='/'/>">Home</a> <span>Shop</span>
			</div>
		</div>
	</div>
	
	<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            		<c:set var="totalEach" value = "${0 }"/>
                            		<c:set var="total" value = "${0 }"/>
	                                <c:forEach var="cartview" items="${cartview }">
		                                <tr>
		                                    <td class="shoping__cart__item">
		                                        <a href="${pageContext.request.contextPath}/product?id=${cartview.bookID}">${cartview.name }</a>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                        $${cartview.price }.00
					                        </td>
											<td class="shoping__cart__quantity">${cartview.amount }</td>
											<c:set var="totalEach" value = "${cartview.amount * cartview.price}"/>
		                                    <c:set var="total" value = "${total + totalEach}"/>
		                                    <td class="shoping__cart__total">
		                                        $${totalEach}.00
		                                    </td>
		                                    <td class="shoping__cart__item__close">
		                                        <a href="${pageContext.request.contextPath}/removefromcart?id=${cartview.id}&userid=${cartview.userID}"><span class="icon_close"></span></a>
		                                    </td>
		                                </tr>                               
	                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="<c:url value='/'/>" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$${total}.00</span></li>
                            <li>Total <span>$${total}.00</span></li>
                        </ul>
                        <a href="${pageContext.request.contextPath}/checkout?userid=${userid}" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	
</body>
</html>