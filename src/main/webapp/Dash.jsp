<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/styles.css">
<link rel="stylesheet" href="./css/dataStyles.css">
<script src="./javascript/Dash.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	padding-top: 0px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}
/* Modal Content */
.modal-content {
	background-color: transparent;
	margin: 5% auto;
	border: 1px solid #888;
	width: 98%;
	max-width: 1100px;
	height: 680px;
	margin-top: 10px;
}
/* Close Button */
.close {
	color: #e51010;
	float: right;
	font-size: 35px;
	font-weight: bold;
	background: transparent;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<title>Fresh Co</title>

</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div id="side-nav">
		<%
		HttpSession sess = request.getSession(false); // Get the session without creating a new one
		String userType = (String) sess.getAttribute("userType"); // Get userType from the session

		if (userType != null && userType.equals("Employee")) {
		%>
		<a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
		<a href="Sale"><span class="material-symbols-outlined">shopping_bag</span>Sale</a> 
		<a href="Category"><span class="material-symbols-outlined">category</span>Category</a> 
		<a href="Product"><span class="material-symbols-outlined">inventory_2</span> Product</a>
		<%
		} else if (userType != null && userType.equals("Manager")) {
		%>
		<a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
		<a href="Category"><span class="material-symbols-outlined">category</span>Category</a>
		<a href="Product"><span class="material-symbols-outlined">inventory_2</span>Product</a> 
		<a href="Enquiry"><span class="material-symbols-outlined">support</span>Enquiry</a> 
		<a href="Sale"><span class="material-symbols-outlined">shopping_bag</span>Sale</a> 
		<a href="Employee"><span class="material-symbols-outlined">badge</span>Employee</a>
		<%
		} else if (userType != null && userType.equals("DeliveryPerson")) {
		%>
		<a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
		<a href="Sale"><span class="material-symbols-outlined">shopping_bag</span>Sale</a>
		<%
		} else if (userType != null && userType.equals("Customer")) {
		%>
		<a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
		<a href="Sale"><span class="material-symbols-outlined">shopping_bag</span>Sale</a>
		<%
		} else if (userType != null && userType.equals("Admin")) {
		%>
		<a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
		<a href="Admin"><span class="material-symbols-outlined">groups</span>Admin</a> 
		<a href="Customer"><span class="material-symbols-outlined">groups</span>Customer</a>
		<a href="Employee"><span class="material-symbols-outlined">badge</span>Employee</a>
		<%
		} else {
		%>
		<h2>Access Denied</h2>
		<p>You do not have permission to view this content.</p>
		<%
		}
		%>
	</div>
</body>

</html>