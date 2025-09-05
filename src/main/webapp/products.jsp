<%@ page import="java.util.List"%>
<%@ page import="com.studentlogin.Product"%>
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
				<li><a class="active" href="load.jsp">Products</a></li>
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
					<li><a class="active1" href="load.jsp">Products</a></li>
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

	<section class="product-section-1">
		<input type="text" placeholder="Enter Product Name"
			class="product-search-box" onkeyup="filterproduct()">
	</section>

	<section class="product-section-2">

		<section class="categories2">
			<div class="category-card1" id="icecream-navigate">
				<a href="#"> <img src="images/ice cream pic.jpg" alt="Ice Cream">
					<h3>Ice Cream</h3></a>
			</div>
			<div class="category-card1" id="grocery-navigate">
				<a href="#"> <img src="images/grosey.webp" alt="Grocery">
					<h3>Grocery</h3></a>
			</div>
			<div class="category-card1" id="events-navigate">
				<a href="#"> <img src="images/order 2.jpg" alt="Events">
					<h3>Events</h3></a>
			</div>
			<div class="category-card1" id="decoration-navigate">
				<a href="#"> <img src="images/shop.jpeg" alt="Decorations">
					<h3>Decorations</h3></a>
			</div>
		</section>
	</section>
	
		<%
    String section = (String) request.getAttribute("section");
	if (section == null) section = "";
%>
	<script>
    window.onload = function () {
        const section = "<%= section %>";
        if (section) {
            const element = document.getElementById(section);
            if (element) {
                element.scrollIntoView({ behavior: "smooth" });
            }
        }
    }
</script>
	

	<section class="product-section-3" id="icecream">
		<h1 id="pro-head" class="hide-icecream">Ice Creams</h1>
		<section class="product">

			<%
			@SuppressWarnings("unchecked")
			List<Product> products = (List<Product>) request.getAttribute("propro");
			System.out.println("hhelllll");
			System.out.println(products);
			//List<Product> products = (List<Product>) request.getAttribute("products"); 
			if (products != null) {
				int i = 0;
				for (Product p : products) {
					if ("ice cream".equalsIgnoreCase(p.getCategory())) {
				System.out.println(i);
				i++;
				int disprice=p.getPrice()-p.getDiscount();
				int percent=((disprice*100)/p.getPrice())-100;
			%>
			<div class="product-card" data-name="<%=p.getName()%>"><a href="product-detials?barcode=<%=p.getBarcode() %>">
				<img src="images/<%=p.getImage()%>" alt="<%=p.getName()%>">
				<h3><%=p.getName()%></h3>
				<h1><span><%=percent%>%   </span>₹<%=disprice%></h1><br>
				<p>M.R.P= <span><%=p.getPrice() %></span></p><br>
				<p>Earn Points:<%=p.getPoints() %></p>
				</a>
			</div>

			<%
			}if (i == 0) {
			System.out.println(i);
			%><script>
			 document.addEventListener("DOMContentLoaded", function() {
					document.querySelector(".hide-icecream").style.display = "none";
			 });
				</script>
			<%
			}
			}
			}
			%>
		</section>
	</section>



	<section class="product-section-3" id="grocery">
		<h1 id="pro-head" class="hide-grocery">Grocery</h1>
		<section class="product">

			<%
			@SuppressWarnings("unchecked")
			List<Product> grocery = (List<Product>) request.getAttribute("propro");
			//List<Product> products = (List<Product>) request.getAttribute("products"); 
			if (grocery != null) {
				int j = 0;
				for (Product p : grocery) {
					if ("grocery".equalsIgnoreCase(p.getCategory())) {
				System.out.println(j);
				j++;
				int disprice=p.getPrice()-p.getDiscount();
				int percent=((disprice*100)/p.getPrice())-100;
			%>
			<div class="product-card" data-name="<%=p.getName()%>">
				<img src="images/<%=p.getImage()%>" alt="<%=p.getName()%>">
				<h3><%=p.getName()%></h3>
				<h1><span><%=percent%>%  </span>₹<%=disprice%></h1><br>
				<p>M.R.P= <span><%=p.getPrice() %></span></p><br>
				<p>Earn Points:<%=p.getPoints() %></p>e
			</div>

			<%
			}
			if (j == 0) {
			System.out.println(j);
			%>
			<script>
			 document.addEventListener("DOMContentLoaded", function() {
				document.querySelector(".hide-grocery").style.display = "none";
			 });
			</script>
			<%
			}
			}
			}
			%>
		</section>
	</section>

	<section class="product-section-3" id="events">
		<h1 id="pro-head" class="hide-events">Events</h1>
		<section class="product">

			<%
			@SuppressWarnings("unchecked")
			List<Product> events = (List<Product>) request.getAttribute("propro");
			//List<Product> products = (List<Product>) request.getAttribute("products"); 
			if (events != null) {
				int k = 0;
					for (Product p : events) {
						if ("events".equalsIgnoreCase(p.getCategory())) {
							System.out.println("before event" + k);
							k++;
			%>
			<div class="product-card" data-name="<%=p.getName()%>">
				<img src="images/<%=p.getImage()%>" alt="<%=p.getName()%>">
				<h3><%=p.getName()%></h3>
				<h1>
					₹<%=p.getPrice()%>/1000pieces
				</h1>
			</div>

						<%
							System.out.println("after event" + k);
						} 
						if (k == 0) 
						{
						%>
						<script>
						 document.addEventListener("DOMContentLoaded", function() {
							document.querySelector(".hide-events").style.display = "none";
						 };
						</script>
						<%
						}
					}
			}
			%>
		</section>
	</section>

	<section class="product-section-3" id="decoration">
		<h1 id="pro-head" class="hide-decoration">Decorations</h1>
		<section class="product">

			<%
			@SuppressWarnings("unchecked")
			List<Product> decoration = (List<Product>) request.getAttribute("propro");
			//List<Product> products = (List<Product>) request.getAttribute("products"); 
			if (decoration != null) {
				int l = 0;
				for (Product p : decoration) {
					if ("decoration".equalsIgnoreCase(p.getCategory())) {
				System.out.println(l);
				l++;
			%>
			<div class="product-card" data-name="<%=p.getName()%>">
				<img src="images/<%=p.getImage()%>" alt="<%=p.getName()%>">
				<h3><%=p.getName()%></h3>
				<h1>
					₹<%=p.getPrice()%></h1>
			</div>

			<%
			}
			if (l == 0) {
			System.out.println(l);
			%>
			<script>
			 document.addEventListener("DOMContentLoaded", function() {
				document.querySelector(".hide-decoration").style.display = "none";
			 });
			</script>
			<%
			}
			}
			}
			%>
		</section>
	</section>


	<section>
		<h6 class="notfound" style="display:none;">No Results Found</h6>
	</section>
	<section>
		<div class="back-to-top">
			<h2>
				<a href="#">Back to top</a>
			</h2>
		</div>
	</section>
	<section class="footer">
		<div class="footer2">
			<div class="footbox1">
				<h3>
					<a href="https://maps.app.goo.gl/oK5i2gdYoMsNgGCL8" target="_blank">
						<i class="fa-solid fa-house"></i>Block office road, near DDRC Lab
						,Melpuram Marthandam ,Kanyakumari <br>
					</a>
				</h3>
				<h3>
					<a href="tel:+91 8940118116" target="_blank"> <i
						class="fa-solid fa-phone" style="color: blue;"></i>+91 8940118116
						<br></a>
				</h3>
				<h3>
					<a href="https://wa.me/+918940118116" target="_blank"> <i
						class="fa-brands fa-whatsapp" style="color: green;"></i>+91
						8940118116
					</a><br>
				</h3>
				<h3>
					<a href="mailto:rusiagencies@gmail.com" target="_blank"> <i
						class="fa-solid fa-envelope" style="color: rgb(205, 41, 41);"></i>rusiagencies@gmail.com
					</a>
				</h3>
			</div>

			<div class="footbox2">
				<h1>About the Agencies</h1>
				<br>
				<h3>It is a one of the best Icecreams supply and events
					managment in Marthandam, melpuram. we suplies best quality of
					Icecream brand as LAZZA .</h3>
			</div>
		</div>
		<div class="footbox3">
			<a href="https://www.instagram.com/_rusi_agencies_/" target="_blank"><i
				class="fa-brands fa-instagram"></i></a> <a
				href="https://www.facebook.com/rusi.agencies/" target="_blank"><i
				class="fa-brands fa-facebook" style="color: blue;"></i></a> <a
				href="https://youtube.com/@rusiagencies4748?si=uxtigLUt0kDdl40j"
				target="_blank"> <i class="fa-brands fa-youtube"></i></a>
		</div>
	</section>



	
	
	<section>
		<script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
	</section>
</body>
</html>



