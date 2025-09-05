<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.studentlogin.Product"%>
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


	<section class="bill-container">
		<div class="bill-nav-section1" id="bns0">
			<ul>
				<li><a class="active1" href="">Generate Bill</a></li>
				<li><a href="">Stack</a></li>
				<li><a href="">Sales</a></li>
				<li><a href="">Tasks</a></li>
				<li><a href="">Logout</a></li>
			</ul>
		</div>
		<div class="bill-nav-section1" id="bns1">
			<button onclick="popupclosemenu1()" class="xmark">
				<i class="fa-solid fa-xmark"></i>
			</button>
			<ul>
				<li><a class="active1" href="">Generate Bill</a></li>
				<li><a href="">Stack</a></li>
				<li><a href="">Sales</a></li>
				<li><a href="">Tasks</a></li>
				<li><a href="">Logout</a></li>
			</ul>
		</div>

		<i onclick="toggleSidebar1()" class="fa-solid fa-bars" id="menu-bar"></i>

		<div class="bill-box">
			<div class="barcode-scanner">
				<form id="scanForm" action="ScanProductServlet" method="post">
					<input type="text" name="barcode" id="barcodeInput"
						placeholder="🔍 Scan or enter barcode..." autofocus>

				</form>
			</div>
			<script>
				document.getElementById("barcodeInput").addEventListener(
						"input", function() {
							// Automatically submit when barcode is fully scanned
							if (this.value.length >= 6) { // depends on your barcode length
								document.getElementById("scanForm").submit();
							}
						});
			</script>


			<%
			Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");
			if (cart != null) {
			%>
			<table>
				<tr>
					<th>S.no</th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
					<th>Del</th>
				</tr>
				<%
				int serial = 1;
				int total = 0;
				int totalamount = 0;
				int GrandTotal = 0;
				int discount = 0;
				for (Product p : cart.values()) {
					total = p.getPrice() * p.getQuantity();
					totalamount = totalamount + total;
					discount = discount + (p.getDiscount() * p.getQuantity());
					GrandTotal = totalamount - discount;
				%>
				<tr>
					<td><%=serial++%></td>
					<td><%=p.getName()%></td>
					<td><%=p.getPrice()%></td>
					<td>
						<form action="UpdateCartServlet" method="post"
							style="display: inline;">
							<input type="hidden" name="code" value="<%=p.getBarcode()%>">
							<button class="qty-btn" name="action" value="decrease">-</button>
							<%=p.getQuantity()%>
							<button class="qty-btn" name="action" value="increase">+</button>
						</form>
					</td>
					<td><%=total%></td>
					<td>

						<form action="RemoveFromCartServlet" method="post" id="removescript"
							onsubmit="return confirmRemove(this)" style="display: inline;">
							<input type="hidden" name="code" value="<%=p.getBarcode()%>">
							<input type="hidden" name="message" value="">
							<button class="delete-btn"
								>X</button>
						</form> 
						<script>
						let form1 = document.getElementById('removescript');
function confirmRemove(form1) {
    if (confirm('Remove product?')) {
    	form.elements["message"].value = "success";
        return true; // allow submit
    }
    return false; // cancel submit
}
</script>
					</td>
				</tr>

				<%
				}
				%>
			</table>
			<h3
				style="text-align: center; margin-left: 900px; margin-top: 10px; margin-right: 140px;">
				Total Amount : ₹
				<%=totalamount%></h3>
			<h3
				style="text-align: center; margin-left: 900px; margin-top: 10px; margin-right: 140px;">
				Discount : ₹
				<%=discount%></h3>
			<h3
				style="text-align: center; margin-left: 900px; margin-top: 10px; margin-right: 140px;">
				Grand Total : ₹
				<%=GrandTotal%></h3>
			<%
			} else {
			%>
			<div class="empty-message">No products scanned yet.</div>
			<%
			}
			%>
			<div class="bill-container1">
				<form id="billForm" action="SaveBillServlet" method="post">
					<input type="text" id="mobileInput" name="mobile"
						placeholder="Enter customer mobile" required />
					<button type="button" id="generateBill">Generate Bill</button>
				</form>

				<div id="toast"
					style="display: none; position: fixed; top: 80%; right: 40%; background: #333; color: #fff; padding: 10px 20px; border-radius: 6px; font-size: 16px; z-index: 9999;">Press
					Enter again to generate bill</div>



				<script>
let enterCount = 0;
let enterTimer = null;

const mobileInput = document.getElementById('mobileInput');
const billForm = document.getElementById('billForm');

mobileInput.addEventListener('keydown', function (event) {
    if (event.key === 'Enter') {
        if (enterCount === 0) {
            event.preventDefault(); // Stop form submit on first enter
            showToast("Press Enter again to generate bill");
            clearTimeout(enterTimer);
            enterTimer = setTimeout(() => enterCount = 0, 3000);
            enterCount++;
        } else if (enterCount === 1) {
            event.preventDefault(); // avoid accidental reload
            billForm.submit(); // Directly submit form on 2nd Enter
            enterCount = 0;
        }
    }
});

function showToast(message) {
    let toast = document.getElementById("toast");
    toast.innerText = message;
    toast.style.display = "block";
    setTimeout(() => {
        toast.style.display = "none";
    }, 2000);
}

document.getElementById("generateBill").addEventListener("click", function() {
    billForm.submit(); // allow normal click submit
});
</script>

<%
			String status3 = request.getParameter("status3");
			%>
			<%
			if ("success".equals(status3)) {
			%>
			<div id="popup3"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Updated successfully!</div>
			<%
			} else if ("error".equals(status3)){
			%>
			<div id="popup3"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to Update!</div>
			<%
			}
			%>

			<script>
setTimeout(() => {
    const popup = document.getElementById("popup3");
    if (popup) popup.style.display = "none";
}, 2000);
</script>

			</div>

			<%
			String status2 = request.getParameter("status2");
			%>
			<%
			if ("success".equals(status2)) {
			%>
			<div id="popup2"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Added successfully!</div>
			<%
			} else if ("error".equals(status2)) {
			%>
			<div id="popup2"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to Add!</div>
			<%
			}
			%>

			<script>
setTimeout(() => {
    const popup = document.getElementById("popup2");
    if (popup) popup.style.display = "none";
}, 1000);
</script>

			<%
			String status1 = request.getParameter("status1");
			%>
			<%
			if ("success".equals(status1)) {
			%>
			<div id="popup1"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Updated successfully!</div>
			<%
			} else if ("error".equals(status1)) {
			%>
			<div id="popup1"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to Update!</div>
			<%
			}
			%>

			<script>
setTimeout(() => {
    const popup = document.getElementById("popup1");
    if (popup) popup.style.display = "none";
}, 2000);
</script>

			<%
			String status = request.getParameter("status");
			%>
			<%
			if ("success".equals(status)) {
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Bill saved successfully!</div>
			<%
			} else if ("error".equals(status)) {
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to save bill!</div>
			<%
			}
			%>

			<script>
setTimeout(() => {
    const popup = document.getElementById("popup");
    if (popup) popup.style.display = "none";
}, 2000);
</script>




		</div>
	</section>








	<script src="js/script.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>