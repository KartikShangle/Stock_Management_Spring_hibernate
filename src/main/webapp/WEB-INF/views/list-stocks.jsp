<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>List Stocks</title>

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
	padding: 15px 0px 15px 15px;
}

#header h2 {
	width: 100%;
	margin: auto;
	margin-top: -1px;
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
	position: absolute;
	right: 20px;
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 12px;
	font-weight: bold;
	width: 120px;
	padding: 5px 10px;
	margin-bottom: 15px;
	background: #cccccc;
	border: 1px solid #666;
}
</style>

</head>

<body>
	<div id="wrapper">
		<div id="header">
			<security:authorize access="isAnonymous()">
				<form action="${pageContext.request.contextPath }/login"
					method="get">
					<input value="Login" type="submit" class="button">
				</form>
			</security:authorize>

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


		<security:authorize access="hasRole('ADMIN')">
			<!-- add Item button -->
			<input type="button" value="Add Item"
				onclick="window.location.href='showFormForAdd'; return false"
				class="add-button" />
			<!-- view cart button -->
			<input type="button" value="View Cart"
				onclick="window.location.href='sellItemForm'; return false"
				class="add-button" />
		</security:authorize>

		<!-- search bar  -->
		<form:form action="search" method="POST">
				Search Item: <input type="text" name="theSearchName" />
			<input type="submit" value="Search" class="add-button" />
		</form:form>

		<!-- html table -->
		<table>
			<tr>
				<th>Item Id</th>
				<th>Item name</th>
				<th>Item price</th>
				<th>Item Count</th>
				<security:authorize access="hasRole('ADMIN')">
					<th>Action</th>
				</security:authorize>
			</tr>

			<!-- print stock using loop -->
			<c:forEach var="tempItem" items="${stocks}">

				<!-- update link -->
				<c:url var="updatelink" value="/stock/showFormForUpdate">
					<c:param name="itemId" value="${tempItem.id}" />
				</c:url>

				<!-- delete link -->
				<c:url var="deletelink" value="/stock/delete">
					<c:param name="itemId" value="${tempItem.id}" />
				</c:url>

				<!-- add to cart link  -->
				<c:url value="/stock/addToCart" var="addToCartLink">
					<c:param name="itemId" value="${tempItem.id }"></c:param>
				</c:url>

				<tr>
					<td>${tempItem.id}</td>
					<td>${tempItem.name}</td>
					<td>${tempItem.price}</td>
					<td>${tempItem.count}</td>
					<security:authorize access="hasRole('ADMIN')">
						<td>
							<!-- display update/delete/add to cart link --> <a href="${updatelink}">Update</a>|<a
							href="${deletelink}"
							onclick="if(!(confirm('Are you sure you want to delete this item?'))) return false">Delete</a>
							<c:if test="${tempItem.count != 0}">|<a
									href="${addToCartLink} ">Add To Cart</a>
							</c:if>
						</td>
					</security:authorize>
				</tr>
			</c:forEach>
			<c:if test="${error == 1 }">
				<script>
					alert("Out Of Stock");
				</script>
			</c:if>
		</table>
	</div>
</body>
</html>
