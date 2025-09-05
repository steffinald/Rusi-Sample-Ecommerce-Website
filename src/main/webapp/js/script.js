/*function filterproduct() {
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
			document.getElementById("pro-head").style.display="none";
        }
        
    });
    
    productsection.style.display = "block";
}
*/
function filterproduct() {
    let input = document.querySelector('.product-search-box').value.toLowerCase();
    let categories = document.querySelectorAll('.product-section-3');
	let noresult = document.querySelector('.notfound');
	
	let visiblecount = 0;

    categories.forEach(category => {
        let cards = category.querySelectorAll('.product-card');
        let matchFound = false;

        cards.forEach(card => {
            let name = card.dataset.name.toLowerCase();
            if (name.includes(input)) {
                card.style.display = "block";
                matchFound = true;
				visiblecount++;
            } else {
                card.style.display = "none";
				
            }
        });
		if(visiblecount === 0){
			noresult.style.display="block";
		}
		else{
			noresult.style.display="none";
		}
		

        // Show or hide the whole category (including title)
        category.style.display = matchFound ? "block" : "none";
		
    });
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

var popupmenu1=document.getElementById("bns1")

function popupclosemenu1(){
    popupmenu1.style.left="-300px";
    
}


//side menu bar
/*
var slide = document.getElementById("inside-side-bar")
function toggleSidebar() {
    slide.style.left="0";   
    console.log("hello")
  }
  
  var slide = document.getElementById("bns1")
  function toggleSidebar1() {
      slide.style.left="0";   
      console.log("hello")
    }
	*/
	
	document.addEventListener("DOMContentLoaded", function () {
		    const slide1 = document.getElementById("inside-side-bar");
		    const slide2 = document.getElementById("bns1");

		    window.toggleSidebar = function () {
		        if (slide1) {
		            slide1.style.left = "0";
		            console.log("Sidebar 1 toggled");
		        } else {
		            console.warn("inside-side-bar element not found");
		        }
		    }

		    window.toggleSidebar1 = function () {
		        if (slide2) {
		            slide2.style.left = "0";
		            console.log("Sidebar 2 toggled");
		        } else {
		            console.warn("bns1 element not found");
		        }
		    }
		});
  
 //admin page

  
  function addproduct() {
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("add-product").style.display = "flex";
	document.getElementById("updatecontainer1").style.display="none";
		 
		 console.log("hello")
  }
  
function deleteproduct() {
	document.getElementById("updatecontainer1").style.display="none";
  	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("delete-product").style.display = "flex";
  		 
    console.log("hello")
}
function changename() {
	document.getElementById("updatecontainer1").style.display="none";
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-name").style.display = "flex";
		 
		 console.log("hello")
}

function changeprice() {
	document.getElementById("updatecontainer1").style.display="none";
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-price").style.display = "flex";
		 
		 console.log("hello")
  }
  
function changedprice() {
	document.getElementById("updatecontainer1").style.display="none";
  	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-discount-price").style.display = "flex";
  		 
    console.log("hello")
}
function changepoint() {
	document.getElementById("updatecontainer1").style.display="none";
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-point").style.display = "flex";
		 
		 console.log("hello")
}
function changecategory() {
	document.getElementById("updatecontainer1").style.display="none";
  	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-category").style.display = "flex";
  		 
    console.log("hello")
}
function changeimage() {
	document.getElementById("updatecontainer1").style.display="none";
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-image").style.display = "flex";
		 
		 console.log("hello")
}
function changedescription() {
	document.getElementById("updatecontainer1").style.display="none";
	document.getElementById("updatecontainer").style.display="none";
    document.getElementById("change-description").style.display ="flex";
		 
		 console.log("hello")
}

//category navigate

document.getElementById("icecream-navigate").addEventListener("click", () => {
  document.getElementById("icecream").scrollIntoView({ behavior: "smooth" })});


document.getElementById("grocery-navigate").addEventListener("click", () => {
  document.getElementById("grocery").scrollIntoView({ behavior: "smooth" })});


document.getElementById("events-navigate").addEventListener("click", () => {
  document.getElementById("events").scrollIntoView({ behavior: "smooth" })});


document.getElementById("decoration-navigate").addEventListener("click", () => {
  document.getElementById("decoration").scrollIntoView({ behavior: "smooth" })});

  
	
	         function editprofile() {
	            document.getElementById("profile-c").style.display = "block";
	            document.getElementById("profile-c").scrollIntoView({ behavior: "smooth" });
	        };
  
  
/*<div onclick="popupclose()" class="pop-up">
<div class="pop-up-box">
<button onclick="popupclose()"><i class="fa-solid fa-xmark"></i></button>
<a href=""><img src="images/UNLIMITED-1.png"  alt="Responsive Image"></a>
</div>
</div>*/