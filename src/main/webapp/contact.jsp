<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>


    <section class="header">
        <div class="side-bar">
            <i onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu" ></i>
        </div>
        <a href="#"><img class="logo" src="images/rusilogo-removebg-preview.png" alt=""></a>
        <div >
            <ul class="nav-bar">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="load.jsp">Products</a></li>
                <li><a href="offers.jsp">Offers</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a class="active" href="contact.jsp">Contact</a></li>
                
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
                        <li><a  href="load.jsp">Products</a></li>
                        <li><a href="offers.jsp">Offers</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a class="active1" href="contact.jsp">Contact</a></li>
                        <li><a href="profileload.jsp">Profile</a></li>
                        <li><a href="dashboard.jsp">DashBoard</a></li>
                        <li><a href="orders.jsp">Orders</a></li>
                        <li><a href="tasks.jsp">Tasks</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>    
            </div>
       
    </section>

    <div class="back-to-top">
        <a href="#"><h2>Back to top</h2></a>
    </div>

    <section class="footer">
        <div class="footer2">
        <div class="footbox1">
            <a href="https://maps.app.goo.gl/oK5i2gdYoMsNgGCL8" target="_blank"><h3><i class="fa-solid fa-house"></i>Block office road, near DDRC Lab ,Melpuram  Marthandam ,Kanyakumari</h3><br></a>
            <a href="tel:+91 8940118116" target="_blank"><h3><i class="fa-solid fa-phone" style="color: blue;"></i>+91 8940118116</h3><br></a>
            <a href="https://wa.me/+918940118116" target="_blank"><h3><i class="fa-brands fa-whatsapp" style="color: green;"></i>+91 8940118116</h3></a><br>
            <a href="mailto:rusiagencies@gmail.com" target="_blank"><h3><i class="fa-solid fa-envelope" style="color: rgb(205, 41, 41);"></i>rusiagencies@gmail.com</h3></a>
        </div>
        
        <div class="footbox2">
            <h1>About the Agencies</h1><br>
            <h3>It is a one of the best Icecreams supply and events managment in Marthandam, melpuram. we suplies best quality of Icecream brand as LAZZA .</h3>
        </div>
        </div>
        <div class="footbox3">
            <a href="https://www.instagram.com/_rusi_agencies_/" target="_blank"><i class="fa-brands fa-instagram"></i></a>
            <a href="https://www.facebook.com/rusi.agencies/" target="_blank"><i class="fa-brands fa-facebook" style="color: blue;"></i></a>
            <a href="https://youtube.com/@rusiagencies4748?si=uxtigLUt0kDdl40j" target="_blank"> <i class="fa-brands fa-youtube"></i></a>
        </div>
    </section>
    <script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
</body>
</html>