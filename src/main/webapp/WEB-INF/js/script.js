function filterproduct() {
    let input = document.querySelector('.product-search-box').value.toLowerCase();
    let productCards = document.querySelectorAll('.product-card');
    let productsection = document.querySelector('.product-section-2');
    let icecream = document.getElementById('pro-head');
    let notfound = document.querySelector('.notfound');

    productCards.forEach(card => {
        let productName = card.getAttribute('data-name');

        if (productName && productName.toLowerCase().includes(input)) {
            card.style.display = "block";
            productsection.style.display = "none";
        }
        else {
            card.style.display = "none";
        }
        
    });
    
    productsection.style.display = "block";
}

/*
function showCategory(categoryId) {
    // Hide all category content divs
    document.querySelectorAll('.category-content').forEach(div => {
        div.style.display = 'none';
    });

    // Show the selected div
    document.getElementById(categoryId).style.display = 'block';
}

*/

// pop up close

var popup=document.querySelector(".pop-up")
var popupimg = document.getElementById("pop-up-img")
function popupclose(){
    popup.style.display="none"
    document.body.classList.remove("no-scroll");
}
var popupmenu=document.getElementById("inside-side-bar")

function popupclosemenu(){
    popupmenu.style.left="-300px";
    
}


//side menu bar

var slide = document.getElementById("inside-side-bar")
function toggleSidebar() {
    slide.style.left="0";   
    console.log("hello")
  }



/*<div onclick="popupclose()" class="pop-up">
<div class="pop-up-box">
<button onclick="popupclose()"><i class="fa-solid fa-xmark"></i></button>
<a href=""><img src="images/UNLIMITED-1.png"  alt="Responsive Image"></a>
</div>
</div>*/