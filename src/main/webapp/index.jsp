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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
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
                        <li><a class="active1" href="index.jsp">Home</a></li>
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
<!--
    <div onclick="popupclose()" class="pop-up">
        <div class="pop-up-box">
            <button onclick="popupclose()"><i class="fa-solid fa-xmark"></i></button>
            <a href="" class="pop-up-image"><img src="images/UNLIMITED-1.png"  alt="Responsive Image"></a>
        </div>
    </div>-->

    <section class="index-section-1">
        <div class="container">
            <div class="bent-line"></div>
            <div class="text">
                <h1 class="ice1">The World's</h1>
                <h1 class="ice2">Finest</h1>
                <h1 class="ice3">Ice Cream</h1>
            </div>
            
        </div>
        <div class="box2">
            <img src="images/trisha_img_hd-removebg-preview.png" alt="">
        </div>
    </section>
    

    
    <section class="index-section-3">
        <h1 class="pc-text">Product Categories</h1>
        <section class="categories">
            <div class="category-card" data-name="icecream"><a href="product-list?section=icecream">
                <img src="images/ice cream pic.jpg" alt="Ice Cream">
                <h3>Ice Cream</h3></a>
            </div>
            <div class="category-card" data-name="grosery"><a href="product-list?section=grocery">
                <img src="images/grosey.webp" alt="Grocery">
                <h3>Grocery</h3></a>
            </div>
            <div class="category-card" data-name="event"><a href="product-list?section=events">
                <img src="images/order 2.jpg" alt="Events">
                <h3>Events</h3></a>
            </div>
            <div class="category-card" data-name="decorations"><a href="product-list?section=decoration
            ">
                <img src="images/shop.jpeg" alt="Decorations">
                <h3>Decorations</h3></a>
            </div>
            <div class="category-card" data-name="clothes"><a href="product-list?section=clothes">
                <img src="images/shop.jpeg" alt="clothes">
                <h3>Clothes</h3></a>
            </div>
        </section>
        
    </section>

    <section class="index-section-4">
        <h1>Featured Products</h1>
        <h3>Ice Creams</h3>
        <section class="section-4-box">
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/sundae1-removebg-preview.png" alt="sundae">
                <h6>Sundae</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/doubles1.svg" alt="double">
                <h6>Doubles</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/cups1-removebg-preview.png" alt="cups">
                <h6>Cups</h6></a>
            </div>
            <div class="fea-product"><a href="product-list?section=icecream">
                <img src="images/casattas-removebg-preview.png" alt="cassata">
                <h6>Cassata</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/cones-removebg-preview.png" alt="Cones">
                <h6>Cones</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/kulfi_stick-removebg-preview.png" alt="kulfi">
                <h6>kulfi</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/family_pack_2-removebg-preview.png" alt="family pack">
                <h6>Family Packs</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/bulk1-removebg-preview.png" alt="bulk">
                <h6>Bulks</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/balls-removebg-preview.png" alt="balls">
                <h6>Balls</h6></a>
            </div>
            <div class="fea-product" ><a href="product-list?section=icecream">
                <img src="images/sandwich-removebg-preview.png" alt="sandwich">
                <h6>Sandwich</h6></a>
            </div>
            <div class="fea-product"><a href="product-list?section=icecream">
                <img src="images/sweet_heart-removebg-preview.png" alt="sweet heart">
                <h6>Sweet Heart</h6></a>
            </div>
            <div class="fea-product"><a href="product-list?section=icecream">
                <img src="images/fru_sticks-removebg-preview.png" alt="frustick">
                <h6>Fru Stick</h6></a>
            </div>
        </section>
    </section>

    <section class="index-section-5">
        <h1>Event Management</h1>
        <section class="section-5-box">
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/popcorn 2.jpg" alt="popcorn">
                <h6>Popcorn</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/suger candy.jpg" alt="suger candy">
                <h6>Suger Candy</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/ballon.jpeg" alt="ballon">
                <h6>Ballon</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/variety tea 1.jpeg" alt="variety tea">
                <h6>Variety Tea</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/ice.jpg" alt="ice cream">
                <h6>Ice Cream</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/tea.webp" alt="Tea">
                <h6>Tea</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/bajji.jpeg" alt="bajji">
                <h6>Bajji</h6></a>
            </div>
            <div class="fea-event"><a href="product-list?section=events">
                <img src="images/welcome toys.jpeg" alt="welcome toys">
                <h6>Welcome Toys</h6></a>
            </div>
        </section>
    </section>

    <section class="index-section-6">
        <h1>Grocery</h1>
        <section class="section-6-box">
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/tooth paste.jpg" alt="tooth paste">
                <h6>Tooth Paste</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/washing powder.jpg" alt="washing powder">
                <h6>Washing Powder</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/beverages.jpg" alt="beverages">
                <h6>beverages</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/soaps.jpeg" alt="soaps">
                <h6>Soaps</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/Snacks.jpg" alt="Snacks">
                <h6>Snaks</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/grains.jpeg" alt="grains">
                <h6>Grains</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/spices.jpg" alt="spices">
                <h6>Spices</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/Pantry Staples.jpg" alt="Pantry Staples">
                <h6>Pantry Staples</h6></a>
            </div>
            <div class="fea-grosery"><a href="product-list?section=grocery">
                <img src="images/oils.jpg" alt="oils">
                <h6>Oils</h6></a>
            </div>
        </section>
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
        <div class="footbox2">
            <a href="adminlogin.jsp "><i class="fa-solid fa-screwdriver-wrench"></i></a>
        </div>
    </section>

    <script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
</body>
</html>