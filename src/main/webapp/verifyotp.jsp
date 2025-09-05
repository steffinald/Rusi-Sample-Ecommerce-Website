<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RUSI</title>
<link rel="image" type="image/png"
	href="images/rusilogo-removebg-preview.png">
<link rel="stylesheet" href="css/style.css?v=<%= System.currentTimeMillis() %>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
</head>
<body>
	<section class="header">
		<div class="side-bar">
			<i onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu"></i>
		</div>
		<a href="#"><img class="logo"
			src="images/rusilogo-removebg-preview.png" alt=""></a>
		<div>
			<ul class="nav-bar">
				<li><a href="index.jsp">Home</a></li>
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
                        <li><a href="dashboard.jsp">DashBoard</a></li>
                        <li><a href="orders.jsp">Orders</a></li>
                        <li><a href="tasks.jsp">Tasks</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</section>
	
	<%
	String otp = (String) session.getAttribute("otp");
	
	%>
	<h2 style="color: black; text-align: center; margin-top: 50px"><%=otp%></h2>
	<%
	
	%>
	
	<section class="lo">
		<div class="login-container">
			<form method="post" action="verifyotp" class="login-form">
				<%
				String mobilenumber = (String) session.getAttribute("mobilenumber");
				%>
				<h2 class="otph2">
					Please enter the OTP sent to
					<%=mobilenumber%>
					<span><a href="">Change</a></span>
				</h2>
				<label for="">Enter OTP</label> <input maxlength="6" type="text" name="userotp"
					placeholder="Enter OTP" required />
				<button type="submit" value="verifyotp">Verify OTP</button>
				<p>
					Not received your code? <a href="">Resend OTP</a>
				</p>

			</form>
		</div>
	</section>

<%
	String msg = request.getParameter("message");
	if (msg != null) {
	%>
	<h2 style="color: black; text-align: center;"><%=msg%></h2>
	<style>
		.lo {
				height: 70vh;
			}
	</style>
	<%
	}
	%>

	<script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
</body>
</html>