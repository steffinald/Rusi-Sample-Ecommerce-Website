<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.studentlogin.Profileclass" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RUSI</title>
    <link rel="image" type="image/png" href="images/rusilogo-removebg-preview.png">
    <link rel="stylesheet" href="css/style.css?v=<%= System.currentTimeMillis() %>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
</head>
<body class="no-scroll">


    <section class="header">
        <div class="side-bar">
            <i onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu" ></i>
        </div>
        <a href="#"><img class="logo" src="images/rusilogo-removebg-preview.png" alt=""></a>
        <div >
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
                <li><a href="points.jsp"><i class="fa-solid fa-gift" ></i></a></li>
                <li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping" id="cart-pic"></i></a></li>
                <li><a href="login.jsp"><i class="fa-solid fa-user" id="profile"></i></a></li>
            </ul>
        </div>

    </section>
    <section>   
        
            <div id="inside-side-bar" >
                <a href="#"><img class="logo2" src="images/rusilogo-removebg-preview.png" alt=""></a>
                <button onclick="popupclosemenu()" class="xmark"><i class="fa-solid fa-xmark"></i></button>
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
<section class="navcontainer">
    <div class="login-navbar">
        <ul>
            <li><a class="active1" href="profileload.jsp">Profile</a></li>
            <li><a href="dashboard.jsp">DashBoard</a></li>
            <li><a href="">My Orders</a></li>
            <li><a href="">Tasks</a></li>
            <li><a href="">Logout</a></li>
        </ul>
    </div>
    
    <%
    
    Profileclass p = (Profileclass) request.getAttribute("profile");
    String mobile = (String) session.getAttribute("mobilenumber");
    System.out.println(p);
%>

    
    

<div class="profile-container">
<div class="profile-header">
				<h1>My Profile</h1>
			</div>

     <div class="user-profile">
    <img alt="" src="images/profile.png">
    <p><%=mobile %></p>
    <form>
        <label>Name:</label>
        <input type="text" name="name" value="<%=(p != null && p.getName() != null) ? p.getName() : "-"%>" readonly />

        <label>Mobile Number:</label>
        <input type="text" value="<%=mobile %>" readonly />

        <label>Email:</label>
        <input type="email" name="email" value="<%=(p != null && p.getEmail() != null) ? p.getEmail() : "-" %>" readonly />

        <label>Address:</label>
        <textarea name="address" rows="4" readonly><%=(p != null && p.getAddress() != null) ? p.getAddress() : "-" %></textarea>
        
        <button type="button" onclick="editprofile()">Edit Profile</button>
    </form>
    </div>
</div>
</section>

<section>
<div class="profile-container">


    <div class="profile-card" id="profile-c">
   
            <button class="close-btn-edit" onclick="goBack()">x</button>
  
    <h2>Edit Profile</h2>
    <form action="${pageContext.request.contextPath}/profile" method="post">
        <label>Name:</label>
        <input type="text" name="name"  required />

        <label>Mobile Number:</label>
        <input type="text" name="mobile" value="<%=mobile %>" readonly />

        <label>Email:</label>
        <input type="email" name="email"  />

        <label>Address:</label>
        <textarea name="address" rows="4"></textarea>

        <button type="submit" class="update-button">Update Profile</button> 
    </form>
    </div>
</div>
</section>
<script>
function goBack(){
	document.getElementById("profile-c").style.display = "none";
}
</script>

<script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>

</body>
</html>
