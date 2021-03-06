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
<title>Admin's Edit</title>
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
		<c:when
			test="${(sessionScope.User.username != null) && sessionScope.User.username == 'admin' }">
			<jsp:include page="adminheader.jsp" />
		</c:when>
		<c:otherwise>
			<c:redirect url="/login" />
		</c:otherwise>
	</c:choose>

	<!-- Hero Section Begin -->
	<div class="breadcrumb-section">
		<img class="banner"
			src="https://www.wallpaperup.com/uploads/wallpapers/2012/09/28/16804/55ef95f4ebe4747a7f520655c0cbba7e-700.jpg">
		<div class="breadcrumb__text">
			<h2>${product.category }</h2>
			<div class="breadcrumb__option text-center">
				<a href="<c:url value='/'/>">Home</a> <span>Shop</span>
			</div>
		</div>
	</div>
	
	    <!-- Product Details Section Begin -->
	<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src=${product.picture } alt="Product Image">
					</div>
				</div>
			</div>
			<form:form action="editProduct" method="Post" modelAttribute="product">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<form:hidden  path="id" value="${product.id }"/>
					<form:hidden  path="picture" value="${product.picture }"/>
					<h3><form:input type = "text"  path="name" value="${product.name }"/></h3>					
					<div class="product__details__rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
					</div>
					Price<div class="product__details__price"><form:input type = "number"  path="price" value="${product.price }"/></div>
					<ul>
						<li><b>Author: </b> <span><form:input type = "text"  path="author" value="${product.author }"/></span></li>
						<li><b>Released Date: </b> <span><form:input type = "text"  path="publicDate" value="${product.publicDate }"/></span></li>
						<li><b>Category: </b> <span><form:input type = "text"  path="category" value="${product.category }"/></span></li>
						<li><b>Availability</b> <span> <span
								class="text-danger"><form:input type = "text"  path="quantity" value="${product.quantity }"/></span> Remain
						</span></li>
						<li><b>Shipping</b> <span>01 day shipping. <samp>Free
									pickup today</samp></span></li>
						<li><b>Weight</b> <span>0.5 kg</span></li>
						<li><b>Share on</b>
							<div class="share">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div>
						</li>
					</ul>
					<br>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			</form:form>
		</div>
	</div>
	</section>
	<!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
			<c:forEach var="product" items="${RelatedProduct}">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<img class="card-img-top" src=${product.picture }
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-center card-Bold">${product.name }</h5>
						<p class="card-text text-center card-Bold">$${product.price }.00</p>
						<div class="row">
							<div class="col-lg-6 left-side text-center">
							<a href="${pageContext.request.contextPath}/product?id=${product.id}"
									class="card-link ">Detail</a>
							</div>
							<div class="col-lg-6 right-side text-center">
								<c:choose>
									<c:when test="${(sessionScope.User.username != null) && sessionScope.User.username == 'admin' }">
										<a href="${pageContext.request.contextPath}/editProduct?productid=${product.id}"
											class="card-link">Add to Cart</a>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${sessionScope.User.username != null }">
												<a
													href="${pageContext.request.contextPath}/
																add?productid=${product.id}&
																userid=${sessionScope.User.id}&
																currentPage=${product.category}"
													class="card-link">Add to Cart</a>
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
					</div>
				</div>
			</c:forEach>
		</div>
        </div>
    </section>
    <!-- Related Product Section End -->

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