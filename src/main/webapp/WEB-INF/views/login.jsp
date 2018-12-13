<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
html, body {
	margin-left: 15px;
	margin-right: 15px;
	padding: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.failed {
	color: red;
}

h2 {
	background: #09c332;
	color: #FFFFFF;
	padding-top: 5px;
	padding-left: 10px;
	padding-bottom: 5px;
}

table {
	font-family: Tahoma, Verdana, Segoe, sans-serif;
	padding-left: 10px;
	width: 100px;
}

th {
	background: none repeat scroll 0 0 #09c332;
	padding-left: 10px;
	color: #FFFFFF;
}

label {
	font-size: 16px;
	width: 100px;
	display: block;
	text-align: right;
	margin-right: 10px;
	margin-top: 8px;
	margin-bottom: 8px;
}

tr {
	border-top: 1px solid gray;
	text-align: center;
}

.button {
	width: 100px;
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 16px;
}
</style>
</head>
<body>

	<h2>Login Form</h2>

	<form:form action="${pageContext.request.contextPath}/loginAction"
		method="post">
		<c:if test="${param.error != null}">

			<i class="failed">Sorry! You entered invalid username/password.</i>

		</c:if>
		<table>
			<tr>
				<td><label>Username:</label></td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td><label>Password:</label></td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><button type="submit" class="button">Login</button></td>
			</tr>
		</table>
	</form:form>
	<br />
</body>
</html>