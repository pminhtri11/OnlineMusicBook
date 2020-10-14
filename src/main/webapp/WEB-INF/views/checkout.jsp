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

	<section class="checkout spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h6>
					<span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
						here</a> to enter your code
				</h6>
			</div>
		</div>
		<div class="checkout__form">
			<h4>Billing Details</h4>
			<form:form action="confirmCheckout?userid=${userid }" method="post" modelAttribute = "payment">
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<div class="checkout__input">
							<p>
								Name on Card<span>*</span>
							</p>
							<form:input type="text" path="cardName"/>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Card Number<span>*</span>
									</p>
									<form:input type="number" path="cardNumber"/>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="checkout__input">
									<p>
										CVV<span>*</span>
									</p>
									<form:input type="number" path="cardCVV"/>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="checkout__input">
									<p>
										Expiration (MM/YY)<span>*</span>
									</p>
									<form:input type="text" path="cardExpirationDate"/>
								</div>
							</div>
						</div>
						<div class="checkout__input">
							<p>
								Address<span>*</span>
							</p>
							<form:input type="text" path="address"/>
						</div>
						<div class="checkout__input">
							<p>
								Town/City<span>*</span>
							</p>
							<form:input type="text" path="city"/>
						</div>
						<div class="checkout__input">
							<p>
								Country/State<span>*</span>
							</p>
							<form:input type="text" path="state"/>
						</div>
						<div class="checkout__input">
							<p>
								Postcode / ZIP<span>*</span>
							</p>
							<form:input type="number" path="zip"/>
						</div>

						<div class="checkout__input">
							<p>
								Order notes<span>*</span>
							</p>
							<form:input type="text" path="note"
								placeholder="Notes about your order, e.g. special notes for delivery." />
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="checkout__order">
							<h4>Your Order</h4>
							<div class="checkout__order__products">
								Products <span>Total</span>
							</div>
							<ul>
                            	<c:set var="totalEach" value = "${0 }"/>
                            	<c:set var="total" value = "${0 }"/>
								<c:forEach var="cartview" items="${cartview }">
									<c:set var="totalEach" value = "${cartview.amount * cartview.price}"/>
		                            <c:set var="total" value = "${total + totalEach}"/>
									<li>${cartview.name } <span>$${totalEach }.00</span></li>
								</c:forEach>
							</ul>

							<div class="checkout__order__total">
								<form:hidden path="total" value="${total }"/>
								<form:hidden path="userid" value="${userid }"/>
								Total <span>$${total }.00</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							<div class="checkout__input__checkbox">
								<label for="paypal"> Paypal <input type="checkbox"
									id="paypal"> <span class="checkmark"></span>
								</label>
							</div>
							<button type="submit" class="site-btn">PLACE ORDER</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	</section>
</body>
</html>