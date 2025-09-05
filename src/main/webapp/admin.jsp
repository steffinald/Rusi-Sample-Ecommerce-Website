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
<body class="no-scroll">
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
	String msg = request.getParameter("message");
	if (msg != null) {
	%>
	<h2 style="color: black; text-align: center; margin-top: 50px;"><%=msg%></h2>
	<style>
.lo {
	height: 70vh;
}
</style>
	<%
	}
	%>

	<section class="admin-product" id="updatecontainer1">
		<div class="admin-container">
			<form class="admin-form" id="button-color">
				<button id="bill-page">Generate Bill</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="updatecontainer">
		<div class="admin-container">
			<form class="admin-form">
				<h2>Click The Button</h2>
				<button type="button" onclick="addproduct()">Add Product</button>
				<button type="button" onclick="deleteproduct()">Delete
					Product</button>
				<button type="button" onclick="changename()">Change Name</button>
				<button type="button" onclick="changeprice()">Change Price</button>
				<button type="button" onclick="changedprice()">Change
					Discount price</button>
				<button type="button" onclick="changepoint()">Change Point</button>
				<button type="button" onclick="changecategory()">Change
					Category</button>
				<button type="button" onclick="changeimage()">Change Image</button>
				<button type="button" onclick="changedescription()">Change
					Description</button>
			</form>
		</div>
	</section>



	<section class="admin-product" id="add-product" style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form"
				enctype="multipart/form-data">
				<h2>Add Product</h2>
				<input type="hidden" name="userId" value="1"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Product Name</label> <input
					name="productname" type="text" placeholder="Enter Product Name"
					required /> <br> <label>Product Price</label> <input
					name="price" type="number" placeholder="Enter Product Price"
					required /> <br> <label>Discount Price</label> <input
					name="discount" type="number" placeholder="Enter Discount Price"
					required /> <br> <label>Point</label> <input name="point"
					type="number" placeholder="Enter Point" required /><br> <label>Product
					Category</label> <input name="Category" type="text"
					placeholder="Enter Product Category" required /> <br> <label>Image</label>
				<input name="file" type="file" accept="image/*" required /> <br>
				<label>Product Description</label> <input name="description"
					type="text" placeholder="Enter Product description" required /> <br>
				<button type="submit" value="upload">Add</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="delete-product"
		style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Delete Product</h2>
				<input type="hidden" name="userId" value="2"> <label>Product
					Name</label> <input name="productname" type="text"
					placeholder="Enter Product Name" required /> <br>
				<button type="submit" value="upload">Delete</button>
			</form>
		</div>
	</section>


	<section class="admin-product" id="change-name" style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Name</h2>
				<input type="hidden" name="userId" value="3"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Product Name</label> <input
					name="productname" type="text" placeholder="Enter Product Name"
					required />
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-price" style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Price</h2>
				<input type="hidden" name="userId" value="4"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Product Price</label> <input
					name="price" type="number" placeholder="Enter Product Price"
					required /> <br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-discount-price"
		style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Discound price</h2>
				<input type="hidden" name="userId" value="5"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Discount Price</label> <input
					name="discount" type="number" placeholder="Enter Discount Price"
					required /> <br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-point" style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Point</h2>
				<input type="hidden" name="userId" value="6"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Point</label> <input
					name="point" type="number" placeholder="Enter Point" required /><br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-category"
		style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Category</h2>
				<input type="hidden" name="userId" value="7"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Product Category</label> <input
					name="Category" type="text" placeholder="Enter Product Category"
					required /> <br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-image" style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form"
				enctype="multipart/form-data">
				<h2>Change Image</h2>
				<input type="hidden" name="userId" value="8"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Image</label> <input
					name="file" type="file" accept="image/*" required /> <br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<section class="admin-product" id="change-description"
		style="display: none;">
		<div class="admin-container">
			<form method="post" action="admin" class="admin-form">
				<h2>Change Description</h2>
				<input type="hidden" name="userId" value="9"> <label>Barcode</label>
				<input name="barcode" type="text" placeholder="Scan barcode"
					autofocus required /> <br> <label>Product Description</label>
				<input name="description" type="text"
					placeholder="Enter Product description" required /> <br>
				<button type="submit" value="upload">change</button>
			</form>
		</div>
	</section>

	<div></div>


<script>
  document.getElementById("bill-page").addEventListener("click", function (event) {
    event.preventDefault(); // Prevent form from submitting and reloading
    window.location.href = "bill.jsp";
  });
</script>
</body>
</html>


	<script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
</body>
</html>

