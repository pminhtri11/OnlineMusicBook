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
<title>Online Musical Store</title>
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
		<c:when test="${sessionScope.User.username != null }">
			<c:choose>
				<c:when test="${sessionScope.User.username ==  'admin'}">
					<jsp:include page="adminheader.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="userheader.jsp" />
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<jsp:include page="header.jsp" />
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
						<li><a href="${pageContext.request.contextPath}/category?name=Piano">Piano</a></li>
						<li><a href="${pageContext.request.contextPath}/category?name=Guitar">Guitar</a></li>
						<li><a href="${pageContext.request.contextPath}/category?name=Violin">Violin</a></li>
						<li><a href="${pageContext.request.contextPath}/category?name=Flute">Flute</a></li>
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
	<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>Our Products</h2>
				</div>
			</div>
		</div>
		<div class="row featured__filter">
			<c:forEach var="product" items="${productList}">
				<div class="card card__control" style="width: 18rem;">
					<img class="card-img-top featured__item__pic set-bg"
						src=${product.picture } alt="Card image cap">
					<div class="card-body featured__item__text">
						<h5 class="card-title">${product.name}</h5>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="row">
									<div class="col-lg-4">
										<p class="author left-side">Author:</p>
									</div>
									<div class="col-lg-8 right-side">${product.author}</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="row">
									<div class="col-lg-4">
										<p class="author left-side">Price:</p>
									</div>
									<div class="col-lg-8 right-side">$${product.price}.00</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="row">
									<div class="col-lg-7 left-side">
										<a href="${pageContext.request.contextPath}/product?id=${product.id}" class="card-link ">More Information</a>
									</div>
									
									<div class="col-lg-5 right-side">
										<c:choose>
											<c:when
												test="${(sessionScope.User.username != null) && sessionScope.User.username == 'admin' }">
												<a
													href="${pageContext.request.contextPath}/editProduct?productid=${product.id}"
													class="card-link">Edit Page</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${sessionScope.User.username != null }">
														<a
															href="${pageContext.request.contextPath}/
														add?productid=${product.id}&
														userid=${sessionScope.User.id}&
														currentPage=${product.category}&
														name=${product.name}&
														picture=${product.picture}&
														price=${product.price}">Add
															to Cart</a>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/loginWithProduct?productid=${product.id}"
															class="card-link">Click Here Log In First</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>

	<jsp:include page="footer.jsp" />
	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>