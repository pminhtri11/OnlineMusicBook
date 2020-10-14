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
<title>LogIn</title>
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
	<jsp:include page="header.jsp" />
	<!-- Hero Section Begin -->
	<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All departments</span>
					</div>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/category?name=Piano">Piano</a></li>
						<li><a
							href="${pageContext.request.contextPath}/category?name=Guitar">Guitar</a></li>
						<li><a
							href="${pageContext.request.contextPath}/category?name=Violin">Violin</a></li>
						<li><a
							href="${pageContext.request.contextPath}/category?name=Flute">Flute</a></li>
						<li><a href="#">Bass Guitar</a></li>
						<li><a href="#">Banjo</a></li>
						<li><a href="#">Bugle</a></li>
						<li><a href="#">Cello</a></li>
						<li><a href="#">French Horn</a></li>
						<li><a href="#">Harp</a></li>
						<li><a href="#">Drums</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="searching" method="post">							
							<input type="text" placeholder="What do you need?" name="id">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone phone_icon"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>+65 11.188.888</h5>
							<span>support 24/7 time</span>
						</div>
					</div>
				</div>
				<c:choose>
				<%-- If the user got redirect here while viewing their product --%>
					<c:when test="${productID != null }">
						<form:form action="checkLoginwithProduct?productID=${productID}"
							method="post" modelAttribute="login">
							<div class="form-group">
								<label for="inputAddress">Please enter your Username</label>
								<form:input class="form-control"
									placeholder="A Place Further than the Universe" type="text"
									path="username" />
							</div>
							<div class="form-group">
								<label for="inputAddress">Please enter your Password</label>
								<form:input class="form-control"
									placeholder="A Place Further than the Universe" type="password"
									path="password" />
							</div>
							<button type="submit" class="btn btn-primary btn-block">Log
								In</button>
						</form:form>
					</c:when>
					<%-- Normal Login --%>
					<c:otherwise>
						<form:form action="checkLogin" method="post"
							modelAttribute="login">
							<div class="form-group">
								<label for="inputAddress">Please enter your Username</label>
								<form:input class="form-control"
									placeholder="A Place Further than the Universe" type="text"
									path="username" />
							</div>
							<div class="form-group">
								<label for="inputAddress">Please enter your Password</label>
								<form:input class="form-control"
									placeholder="A Place Further than the Universe" type="password"
									path="password" />
							</div>
							<button type="submit" class="btn btn-primary btn-block">Log
								In</button>
						</form:form>
					</c:otherwise>
				</c:choose>
				
					
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>