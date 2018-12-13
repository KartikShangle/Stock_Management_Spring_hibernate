<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Save Stock</title>

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
	width: 72%;
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
	padding: 4px;
	font-size: 12px;
	font-weight: bold;
	width: 120px;
	padding: 5px 10px;
	margin-bottom: 15px;
	background: #cccccc;
}

form {
	margin-top: 10px;
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

input {
	width: 250px;
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 16px;
}

.save {
	font-weight: bold;
	width: 130px;
	padding: 5px 10px;
	margin-top: 30px;
	background: #cccccc;
}

table {
	border-style: none;
	width: 100;
}

a {
	font-size: 15px;
}

tr:nth-child(even) {
	background: #FFFFFF
}

tr:nth-child(odd) {
	background: #FFFFFF
}

tr {
	border-style: none;
	text-align: left;
}

.error {
	color: #ff0000;
}
</style>

</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Stock Management</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Stock</h3>
		<form:form action="saveStock" modelAttribute="stock" method="POST">

			<!-- associate this data with item id -->
			<table>
				<tbody>
					<tr>
						<td><label>Item Id: </label></td>
						<td><form:input path="id" /> <form:errors path="id"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td><label>Item Name: </label></td>
						<td><form:input path="name" /> <form:errors path="name"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td><label>Item Price: </label></td>
						<td><form:input path="price" /> <form:errors path="price"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td><label>Item Count: </label></td>
						<td><form:input path="count" /> <form:errors path="count"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
				</tbody>
			</table>
		</form:form>
		<div style=""></div>

		<p>
			<a href="${pageContext.request.contextPath}/stock/list">Back to
				Home</a>
		</p>
	</div>
</body>
</html>