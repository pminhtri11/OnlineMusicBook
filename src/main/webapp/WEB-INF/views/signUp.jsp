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
<title>Sign Up page</title>
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
						<li><a href="#">Fresh Meat</a></li>
						<li><a href="#">Vegetables</a></li>
						<li><a href="#">Fruit & Nut Gifts</a></li>
						<li><a href="#">Fresh Berries</a></li>
						<li><a href="#">Ocean Foods</a></li>
						<li><a href="#">Butter & Eggs</a></li>
						<li><a href="#">Fastfood</a></li>
						<li><a href="#">Fresh Onion</a></li>
						<li><a href="#">Papayaya & Crisps</a></li>
						<li><a href="#">Oatmeal</a></li>
						<li><a href="#">Fresh Bananas</a></li>
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
				<form:form action="saveUser" method="post" modelAttribute="user">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label> 
							<form:input class="form-control" type="text" path="email"/>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Password</label> 
							<form:input class="form-control" type="password" path="password"/>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Your Name</label> 
							<form:input class="form-control" type="text" path="name"/>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Create a Username</label> 
							<form:input class="form-control" type="text" path="username"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Address</label> 
						<form:input class="form-control" placeholder="A Place Further than the Universe" type="text" path="address"/>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label>
							<form:input class="form-control" placeholder="A real Place" type="text" path="city"/>
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label>
							<form:input class="form-control" placeholder="TX" type="text" path="state"/>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> 
							<form:input class="form-control" placeholder="123 Main" type="number" path="zip"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Sign
						Up</button>
				</form:form>
			</div>
		</div>
	</div>
	</section>

	<jsp:include page="footer.jsp" />
</body>
</html>