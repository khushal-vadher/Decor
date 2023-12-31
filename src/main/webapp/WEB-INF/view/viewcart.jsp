<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty cartList}">
		<!-- <a href="invoicePage">Place Order</a> -->
		<form:form action="invoicePage" modelAttribute="cartList" style="display: flex;
    justify-content: center;">
			<input type="submit" value="Place Order" style="margin-top: 50px;     font-size: 23px;">
		</form:form>
	</c:if>
	
	
	<c:forEach var="cart" items="${cartList}" varStatus="thecount">
		<div style="   display: flex;
    margin-right: 456px;
    margin-left: 456px;
    /* justify-content: center; */
    flex-direction: column;
    align-content: center;
    align-items: center;
    margin-top: 50px;
    border: 5px solid #111010;">	
		<p >No. :- ${thecount.count}</p>
		<p>Cart Price :- ${cart.cartPrice}</p>
		<p>Product Name :- ${cart.product.pName}</p>
		<p>Product Price :- ${cart.product.pPrice}</p>
		<form action="updateCart" method="POST">
			<input type="hidden" name="cartId" value="${cart.cartId}">
			Quantity :- <input type="number" name="quantity" value="${cart.quantity}" min="1" max="${cart.product.pQuantity}">
			<button type="submit">Update Cart</button>
		</form>
		<br>
		<form action="deleteCart" method="POST">
			<input type="hidden" name="cartId" value="${cart.cartId}">
			<button type="submit">Delete Cart</button>
		</form>
		</div>
	</c:forEach>
	

</body>
</html>
<%
	}
%>