<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Items</title>

<style type="text/css">
html, body {
	margin-left: 15px;
	margin-right: 15px;
	padding: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

table {
	border-collapse: collapse;
	border-bottom: 1px solid gray;
	font-family: Tahoma, Verdana, Segoe, sans-serif;
	width: 100%;
}

th {
	border-bottom: 1px solid gray;
	background: none repeat scroll 0 0 #09c332;
	padding: 10px;
	color: #FFFFFF;
}

tr {
	border-top: 1px solid gray;
	text-align: center;
}

tr:nth-child(even) {
	background: #FFFFFF
}

tr:nth-child(odd) {
	background: #BBBBBB
}

#wrapper {
	width: 100%;
	margin-top: 0px;
	clearfix: auto;
}

#header {
	width: 100%;
	background: #09c332;
	margin-top: 0px;
	padding: 5px 0px 10px 10px;
}

#header h2 {
	width: 100%;
	margin: auto;
	color: #FFFFFF;
}

#container {
	width: 100%;
	margin: auto
}

#container h3 {
	color: #000;
}

#container #content {
	margin-top: 20px;
}

.add-button {
	border: 1px solid #666;
	border-radius: 5px;
	font-size: 12px;
	font-weight: bold;
	width: 120px;
	padding: 5px 10px;
	margin-bottom: 15px;
	background: #cccccc;
}

.button {
	border: 1px solid #666;
	border-radius: 5px;
	font-size: 12px;
	font-weight: bold;
	width: 120px;
	padding: 5px 10px;
	margin-bottom: 15px;
	background: #cccccc;
	border: 1px solid #666;
	float: right;
}

h4 {
	float: right;
	padding-right: 20px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<security:authorize access="hasRole('ADMIN')">
				<form action="${pageContext.request.contextPath}/logout"
					method="post">
					<input value="Logout" type="submit" class="button">
				</form>
			</security:authorize>

			<h2>Stock Management</h2>
		</div>
	</div>

	<div id="container">
		<div id="content"></div>
		<table>
			<tr>
				<th>Item Id</th>
				<th>Item name</th>
				<th>Quantity</th>
				<th>Rate</th>
				<th>Total Price</th>

				<!-- print stock using loop -->

				<c:set var="amount" value="${0}" />
				
				<c:set var="itm" value="${0}" />
				
				<c:forEach var="tempItem" items="${stocks}">
					<c:url var="updatelink" value="/stock/showFormForUpdate">
						<c:param name="itemId" value="${tempItem.id}" />
					</c:url>

					<c:if test="${tempItem.id != itm }">
						<tr>
							<td>${tempItem.id}</td>
							<td>${tempItem.name}</td>
							<td><c:set var="quantity" value="0" />
							 <c:forEach var="temp" items="${stocks}">
									<c:if test="${tempItem.id == temp.id}">
										<c:set var="itm" value="${temp.id }" />

										<script>
											itm = ${temp.id};
											${quantity = quantity + 1};
										</script>
									</c:if>
								</c:forEach> ${quantity}</td>
							<td>${tempItem.price }</td>
							<td>${tempItem.price * quantity}</td>
						</tr>
					</c:if>

					<c:set var="amount" value="${amount + tempItem.price}" />
				</c:forEach>
		</table>

		<h4>Total: ${ amount}</h4>

		<br> <br>
		
		<c:url var="checkOutLink" value="/stock/checkOut?amount=${amount}" />
		
		<input value="Check Out" type="submit" class="add-button"
			onClick="window.location.href='checkOut'; return false" />
			
		<p>
			<a href="${pageContext.request.contextPath}/stock/list">Back to
				Home</a>
		</p>
	</div>
</body>
</html>