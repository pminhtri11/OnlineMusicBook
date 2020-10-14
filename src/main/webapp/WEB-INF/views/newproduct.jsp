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
<title>New Product</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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
		<c:when test="${sessionScope.User.username == 'admin'}">			
			<jsp:include page="adminheader.jsp" />
		</c:when>
		<c:otherwise>
			<c:redirect url = "/login"/>
		</c:otherwise>
	</c:choose>
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
				<div class="hero__item bannerBg">
					<div class="hero__text">
						<h3>
							"You can own a billion books <br />and still be ignorant"
						</h3>
						<span>Mokokoma Mokhonoana</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Featured Section Begin -->
	<div class="container">
		<form:form action="saveProduct" method="post" modelAttribute="product">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputEmail4">Name</label>
					<form:input class="form-control" type="text" path="name" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">Publish Date</label>
				<form:input class="form-control" type="date" path="publicDate" />
			</div>

			<div class="form-group">
				<label for="inputAddress">Picture Link</label>
				<form:input class="form-control" type="text" path="picture" />
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Author</label>
					<form:input class="form-control" type="text" path="author" />
				</div>
				<div class="form-group col-md-3">
					<label for="inputZip">Price</label>
					<form:input class="form-control" type="number" path="price" />
				</div>
				<div class="form-group col-md-3">
					<label for="inputZip">Quantity</label>
					<form:input class="form-control" type="number" path="quantity" />
				</div>
			</div>
			<div class="form-group category">
				<label>Category</label>
				<form:select class="form-control" id="category" path="category">
					<form:option value="Violin" />Violin
					<form:option value="Guitar" />Guitar
					<form:option value="Piano" />Piano
					<form:option value="Flute" />Flute
				</form:select>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>