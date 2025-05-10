<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.CategoryDBUtil"%>
<%@ page import="freshco.Beans.Category"%>
<%@ page import="freshco.Model.ProductDBUtil" %>
<%@ page import="freshco.Beans.Product" %>
<%@ page import="freshco.Model.FeedbackDBUtil" %>
<%@ page import="freshco.Beans.Feedback" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>


    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    
    <link rel="stylesheet" href="./css/index.css">

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    

    <style>
        
        .container {
            text-align: center;
            padding: 10px 20px;
        }
        
        .contact-title {
            font-size: 2.8em;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }
        
        .contact-subtitle {
            font-size: 1.4em;
            margin-bottom: 30px;
            color: #666;
        }
        
        .contact-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
            background: #d2d9d3;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        
        .contact-form input,
        .contact-form textarea {
            padding: 15px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 8px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #c0e1e1;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            outline: none;
        }
        
        .contact-form button {
            padding: 15px 25px;
            font-size: 1.1em;
            color: #fff;
            background-color: #39e43f;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        
        .contact-form button:hover {
            background-color: #05a748;
            transform: translateY(-2px);
        }
        
        
        .info-section {
            background-color: #7bb083;
            color: rgb(253, 255, 252);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 40px 20px;
            gap: 20px;
            border-radius: 10px;
            margin-bottom: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        
        .info-box {
            text-align: center;
            width: 250px;
            padding: 20px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .info-box h3 {
            font-size: 1.3em;
            margin-bottom: 10px;
        }
        
        .info-box p {
            font-size: 1em;
        }
        
        .info-box i {
            font-size: 3em;
            margin-bottom: 10px;
        }
        
        @media (max-width: 600px) {
            .contact-form {
                padding: 0 10px;
            }
            .info-section {
                flex-direction: column;
            }
        }
        
        .home-bg{
         background-image: url(./image/home-bg.jpg);
        background-size: cover;
        background-position: center;
        align-items: center;
        justify-content: center;
        width: 90%;
        margin-top: 10px;
        margin-left: 4.5%;
        border-radius:20px ;
        
    </style>

</head>

<body>
<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script>
        alert("<%= errorMessage %>");
	</script>
	<%
	}
	%>
<header>
<jsp:include page="header.jsp"/>
</header>

    <section class="home-bg">

        <div class="home">

            <div class="content">
                <span>Fresh and Organic Product for You</span>
                <h3>Order Your Daily Grocery</h3>
                <strong>#FREE DELIVERY</strong>

                <form action="" class="search-box">
                    <i class="fas fa-search">  </i>

                    <input type="text" class="search-input" placeholder="Search your Daily Grocery" name="search" required>
                    <input type="submit" class="search-button" value="search">
                </form>
	

            </div>

        </div>

        <!--category Start-->

    </section>
    <section id="catagory">
        <div class="catagory-heading">

            <h2>Catagory</h2>
            <span>All</span>
        </div>

        <div class="category-container">
                 <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Category> categories = (List<Category>)request.getAttribute("categories");
                        if (categories != null) {
                            for (Category cat : categories) {
                    %>
            <a href="#" class="category-box">

                <img src="<%= cat.getImgUrl() %>" alt="<%= cat.getCategory_Name() %>">
                <span><%= cat.getCategory_Name() %></span>

            </a>
	 <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
          
        </div>
    </section>
    <!--category end-->


    <!--Popular Product-->

    <section id="popular-product">

        <div class="product-heading">
            <h3>Popular Products</h3>
            <span>All</span>

        </div>



        <div class="product-cantainer">
 <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Product> products = (List<Product>)request.getAttribute("products");
                        if (products != null) {
                            for (Product pro : products) {
                            	%>
                            	
            <div class="product-box">
                <img src="<%= pro.getImgUrl() %>" alt="<%= pro.getProductName() %>">
                <strong><%= pro.getProductName() %></strong>
                <span class="Quantity"><%= pro.getUnit() %></span>
                <span class="price"><%= pro.getPrice() %>/=</span>

                <a href="#" class="cart-button">
                    <i class="fas fa-shopping-bag"></i> Add To Cart
                </a>
            </div>
            <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
        </div>


    </section>

    <!--Popular Product end-->


    <!--Client start-->

    <section  id="client">

        <div class="client-heading">
           <h3>Our Regular and Trustful Clients</h3>
        </div>
     
        <div class="client-box-container">
     
           <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Feedback> feedback = (List<Feedback>) request.getAttribute("feedbacks");
                        if (feedback != null) {
                        for (Feedback Feed : feedback) {
                    %>
           <div class="client-box">
      
              <div class="client-profile">
                 <div class="profile-text">
                   <strong>Order#<%= Feed.getOID()%></strong>
                 </div>
              </div>
     
             <div class="Rating">
    <%
        int rating = Feed.getRating();  
        for (int i = 0; i < rating; i++) {
    %>
        <i class="fas fa-star"></i>
    <%
        }
    %>
</div>

              <p><%= Feed.getComments() %></p>
     
           </div>
           <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
     
        </div>
     
       
     </section>

     <!--Client end-->


    <script src="https://unpkg.com/scrollreveal"></script>
    <script>
        const srLeft = ScrollReveal({
            origin: 'left',
            distance: '80px',
            duration: 2000,
            reset: true
        });

        srLeft.reveal('.product-cantainer', {
            delay: 100
        });

        const srTop = ScrollReveal({
            origin: 'top',
            distance: '80px',
            duration: 2000,
            reset: true
        });

        srTop.reveal('.catagory-heading', {
            interval: 200
        });
        srTop.reveal('.product-heading', {
            interval: 200
        });

        const srRight = ScrollReveal({
            origin: 'right',
            distance: '80px',
            duration: 2000,
            reset: true
        });

        srRight.reveal('.home', {
            delay: 100
        });
        srRight.reveal('.category-container', {
            delay: 100
        });



        function myMenuFunction() {
            var menuBtn = document.getElementById('myNavMenu');
            if (menuBtn.className === "nav-menu") {
                menuBtn.className += " responsive";
            } else {
                menuBtn.className = "nav-menu";
            }
        }


        window.onscroll = function() {
            headerShadow();
        };

        function headerShadow() {
            const navHeader = document.getElementById("header");
            if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                navHeader.style.boxShadow = "0 1px 6px rgba(0, 0, 0, 0.1)";
                navHeader.style.height = "70px";
                navHeader.style.lineHeight = "70px";
            } else {
                navHeader.style.boxShadow = "none";
                navHeader.style.height = "90px";
                navHeader.style.lineHeight = "90px";
            }
        }


        const sections = document.querySelectorAll('section[id]');

        function scrollActive() {
            const scrollY = window.scrollY;
            sections.forEach(current => {
                const sectionHeight = current.offsetHeight,
                    sectionTop = current.offsetTop - 50,
                    sectionId = current.getAttribute('id');
                if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
                    document.querySelector('a[href*=' + sectionId + ']').classList.add('active-link');
                } else {
                    document.querySelector('a[href*=' + sectionId + ']').classList.remove('active-link');
                }
            });
        }

        window.addEventListener('scroll', scrollActive);
    </script>

    <!--ContactUs start-->

    

    <section data-aos="fade-right" id="contactUS">

        <div class="container">
            <h1 class="contact-title">Contact Us</h1>
            <p class="contact-subtitle">We'd love to hear from you! Please fill out the form below to get in touch.</p>
            <form class="contact-form" action="EnquiryForm" method="post">
                <input type="email" placeholder="Your Email Address" id="email" name="email" required>
                <input type="text" placeholder="Enter Subject" id="subject" name="subject" required>
                <textarea placeholder="Your Message" rows="5" id="Comments" name="comments" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
    
        <div class="info-section">
            <div class="info-box">
                <i class="fas fa-info-circle"></i>
                <h3>About Us</h3>
                <p>Learn more about our club and the services we offer.</p>
            </div>
            <div class="info-box">
                <i class="fas fa-phone-alt"></i>
                <h3>Phone</h3>
                <p>+912 3 567 8987<br>+912 5 252 3336</p>
            </div>
            <div class="info-box">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Office Location</h3>
                <p>The Interior Design Studio Company<br>The Courtyard, Al Quoz 1, Colorado, USA</p>
            </div>
        </div>
    

        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        
    </section>
    <script>
        AOS.init();
    </script>

    <!--ContactUs end-->

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>


<footer>
 	<jsp:include page="footer.jsp"/>
</footer>


</body>

</html>