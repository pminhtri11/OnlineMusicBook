<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin header</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@500&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
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
	<c:choose>
		<c:when test="${(sessionScope.User.username != null) && sessionScope.User.username == 'admin' }">			
			<jsp:include page="adminheader.jsp" />
		</c:when>
		<c:otherwise>
			<c:redirect url = "/login"/>
		</c:otherwise>
	</c:choose>
	<div class="container">
		<h3 class="text-center">Our Most Popular Products</h3>
		<hr>
		<div class="containerProduct mx-auto">
			<div class="card-deck">
			<c:forEach var="product" items="${product}">
				<div class="card">
					<img class="card-img-top adminInfocard mx-auto" src=${product.picture } alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-center">${product.name }</h5>
						<h6 class="card-subtitle mb-2 text-muted text-center">$${product.price }.00</h6>
						<h6 class="card-subtitle mb-2 text-muted text-center">Remain: ${product.quantity }</h6>
					</div>
					<div class="card-footer text-center">
						<a href="${pageContext.request.contextPath}/editProduct?productid=${product.id}" class="btn-primary btn-lg btn-block">Click Here Edit</a>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>

	<div class="container">
		<h3 class="text-center">Product need to be refill soon (less than 5)</h3>
		<hr>
		<div class="container mx-auto">
			<div class="card-deck">
				<c:forEach var="low" items="${low}">
					<div class="card">
						<img class="card-img-top adminInfocard mx-auto"
							src=${low.picture } alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title text-center">${low.name }</h5>
							<h6 class="card-subtitle mb-2 text-muted text-center">$${low.price
								}.00</h6>
							<h6 class="card-subtitle mb-2 text-muted text-center">Remain:
								${low.quantity }</h6>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="container">
		<h3 class="text-center">Our Most Recent Order</h3>
		<hr>
		<div class="card-group">
			<c:forEach var="order" items="${recentorder }">
				<div class="card text-white bg-warning mb-3"
					style="max-width: 18rem;">
					<div class="card-header text-primary">User ID: ${order.userid }</div>
					<div class="card-body">
						<h5 class="card-title text-info">Total: $${order.total }.00</h5>
						<p class="card-text text-info ">Date: ${order.checkoutDate }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>