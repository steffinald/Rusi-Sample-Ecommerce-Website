<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.studentlogin.Profileclass"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RUSI</title>
<link rel="image" type="image/png"
	href="images/rusilogo-removebg-preview.png">
<link rel="stylesheet"
	href="css/style.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
</head>
<body class="no-scroll">


	<section class="header">
		<div class="side-bar">
			<i onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu"></i>
		</div>
		<a href="#"><img class="logo"
			src="images/rusilogo-removebg-preview.png" alt=""></a>
		<div>
			<ul class="nav-bar">
				<li><a class="active" href="index.jsp">Home</a></li>
				<li><a href="load.jsp">Products</a></li>
				<li><a href="offers.jsp">Offers</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>

			</ul>
		</div>
		<div>
			<ul class="cart-sec">
				<li><a href="points.jsp"><i class="fa-solid fa-gift"></i></a></li>
				<li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"
						id="cart-pic"></i></a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-user"
						id="profile"></i></a></li>
			</ul>
		</div>

	</section>
	<section>

		<div id="inside-side-bar">
			<a href="#"><img class="logo2"
				src="images/rusilogo-removebg-preview.png" alt=""></a>
			<button onclick="popupclosemenu()" class="xmark">
				<i class="fa-solid fa-xmark"></i>
			</button>
			<div>
				<ul class="inside-nav-bar">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="load.jsp">Products</a></li>
					<li><a href="offers.jsp">Offers</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a href="profileload.jsp">Profile</a></li>
					<li><a class="active1" href="dashboard.jsp">DashBoard</a></li>
					<li><a href="orders.jsp">Orders</a></li>
					<li><a href="tasks.jsp">Tasks</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>

	</section>
	<section class="navcontainer">
		<div class="login-navbar">
			<ul>
				<li><a href="profileload.jsp">Profile</a></li>
				<li><a class="active1" href="dashboard.jsp">DashBoard</a></li>
				<li><a href="orders.jsp">My Orders</a></li>
				<li><a href="tasks.jsp">Tasks</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>

		<div class="dashboard-container">
			<div class="dashboard-header">
				<h1>My Dashboard</h1>
			</div>

			<div class="welcome">
				Welcome back, <strong><%=session.getAttribute("username")%></strong>!
			</div>

			<div class="dashboard-section">
				<a><div class="card">
					<i class="fa-solid fa-cart-shopping"></i>
					<h3>My Purchase</h3>
				</div></a>
				<a><div class="card">
					<i class="fa-solid fa-money-bill-trend-up"></i>
					<h3>My Earnings</h3>
				</div></a>
				<a href="tasks.jsp"><div class="card">
					<i class="fa-solid fa-list-check"></i>
					<h3>My Tasks</h3>
				</div></a>
				<a href="points.jsp"><div class="card">
					<i class="fa-solid fa-gift"></i>
					<h3>My Points</h3>
				</div></a>
				
			</div>
			<div class="my-purchase-page">
			<h2>My Purchase</h2>
			<h3>Total Purchase - 20 Orders</h3>
			<h3>Total Amount - ₹6800</h3>
			</div>
			<div class="my-earning-page">
			<h2>My Earnings</h2>
			<h3>Discounts - ₹680</h3>
			<h3>Points - ₹68</h3>
			<h3>Total Earnings - ₹6800</h3>
			</div>
		</div>
	</section>





	<script src="js/script.js?v=<%=System.currentTimeMillis()%>"></script>

</body>
</html>
