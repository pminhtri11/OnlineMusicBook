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
			<div class="col-lg-8">
				<div class="hero__search__form categoryForm">
					<form action="searching" method="post">							
							<input type="text" placeholder="What do you need?" name="id">
							<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>
			</div>
			<div class="col-lg-4">
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
		</div>
	</div>
	</section>
	<!-- Breadcrumb Section Begin -->
	<div class="breadcrumb-section">
		<c:choose>
			<c:when test="${ category == 'Guitar' }">
				<img class="banner"	src="${pageContext.request.contextPath}/resources/img/guitar.PNG">
				<div class="breadcrumb__text">
				<h2>Guitar Books</h2>
			</c:when>
			<c:when test="${ category == 'Piano' }">
				<img class="banner"	src="${pageContext.request.contextPath}/resources/img/piano.jpg">
				<div class="breadcrumb__text">
				<h2>Piano Books</h2>
			</c:when>
			<c:when test="${ category == 'Flute' }">
				<img class="banner"	src="${pageContext.request.contextPath}/resources/img/flute.jpg">
				<div class="breadcrumb__text">
				<h2>Flute Books</h2>
			</c:when>
			<c:when test="${ category == 'Violin' }">
				<img class="banner"	src="${pageContext.request.contextPath}/resources/img/violin.jpg">
				<div class="breadcrumb__text">
				<h2>Violin Books</h2>
			</c:when>
		</c:choose>		
			<div class="breadcrumb__option text-center">
				<a href="<c:url value='/'/>">Home</a> <span>Shop</span>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>Department</h4>
						<ul>
							<li><a href="${pageContext.request.contextPath}/category?name=Guitar">Guitar</a></li>
							<li><a href="${pageContext.request.contextPath}/category?name=Piano">Piano</a></li>
							<li><a href="${pageContext.request.contextPath}/category?name=Violin">Violin</a></li>
							<li><a href="${pageContext.request.contextPath}/category?name=Flute">Flute</a></li>
						</ul>
					</div>

				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
								<span>Sort By</span> <select>
									<option value="0">Default</option>
									<option value="0">Default</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${found} </span> Products found
								</h6>
							</div>
						</div>
						<div class="col-lg-4 col-md-3">
							<div class="filter__option">
								<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="product" items="${productList}">
						<div class="col-lg-4">
							<div class="card card__control">
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
												<div class="col-lg-8 right-side">$${product.price}</div>
											</div>
										</li>
										<li class="list-group-item">
											<div class="row">
												<div class="col-lg-7 left-side">
													<a href="${pageContext.request.contextPath}/product?id=${product.id}" class="card-link ">Detail</a>
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
						</div>
					</c:forEach>
				</div>
				<!-- 				<div class="product__pagination"> -->
				<!-- 					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i -->
				<!-- 						class="fa fa-long-arrow-right"></i></a> -->
				<!-- 				</div> -->
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>