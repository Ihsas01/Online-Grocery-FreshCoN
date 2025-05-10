<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        /* Header for About Us */
        .about-header {
            background-color: #f0f0f0;
            padding: 20px 0;
            text-align: center;
        }
        .about-header h1 {
            font-size: 2.5em;
            margin: 0;
            color: #333;
        }
 
        /* Flexbox layout for image and content */
        .about-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 50px;
            background-color: #fff;
        }
        /* Image on the left */
        .about-image {
            flex: 1;
            text-align: left;
        }
        .about-image img {
            width: 60%;
            border-radius: 10px;
            margin-left: 80px;
        }
        /* Content on the right */
        .about-content {
            flex: 1;
            padding-left: 30px;
        }
        .about-content h2 {
            font-size: 2.5em;
            color: #66b03e;
            margin-bottom: 20px;
        }
        .about-content p {
            font-size: 1.2em;
            color: #555;
            line-height: 1.6;
        }

        /* Gallery Section */
        .gallery-section {
            padding: 50px;
            background-color: #fff;
        }

        .gallery-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .gallery-header h2 {
            font-size: 2em;
            color: #666b;
            margin: 0;
        }

        .gallery-header h2 span {
            color: #66b03e; /* Highlighted part of title */
        }

        .view-all {
            font-size: 1em;
            color: #666;
        }

        .view-all a {
            text-decoration: none;
            color: #666;
            font-weight: bold;
        }

        .view-all a:hover {
            text-decoration: underline;
            color: #66b03e;
        }

        /* Image Grid */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 50px;
        }

        .gallery-grid img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .gallery-grid img:hover {
            transform: scale(1.05);
        }
        @media (max-width: 1200px) {
            .gallery-grid {
                grid-template-columns: repeat(3, 1fr); /* 3 images per row for medium screens */
            }
        }

        @media (max-width: 768px) {
            .gallery-grid {
                grid-template-columns: repeat(2, 1fr); /* 2 images per row for small screens */
            }
        }

        @media (max-width: 480px) {
            .gallery-grid {
                grid-template-columns: 1fr; /* 1 image per row for mobile screens */
            }
        }
    </style>
</head>
<body>

<jsp:include page = "header.jsp"/>
    <!-- About Us Header -->
    <div class="about-header">
        <h1>About Us</h1>
       
    </div>

    <!-- About Us Section with Flexbox Layout -->
    <section class="about-container">
        <!-- Image on the left -->
        <div class="about-image">
            <img id="sliderImage" src="image/about us 5.png" alt="Fresh Groceries">


        </div>
        <!-- Content on the right -->
        <div class="about-content">
            <h2>Welcome To Our Shop</h2>
            <p>
                Fresh and Organic Groceries. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Duis nec porta mi. Aenean interdum dolor nec bibendum viverra. Aliquam vel urna odio. 
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam interdum diam nec lectus gravida, nec ullamcorper lacus posuere.
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod possimus atque accusantium a molestias recusandae, quia neque quam 
                debitis corrupti nisi alias facere odio. Eveniet quibusdam voluptates aliquid accusantium deleniti!
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, nostrum expedita optio debitis qui earum et quia exercitationem,
                 molestiae nesciunt porro ipsa distinctio illo nulla alias fugiat quasi quaerat recusandae.
            </p>
           
        </div>
    </section>

     <!-- Gallery Section -->
     <section class="gallery-section">
        <div class="gallery-header">
            <h2>Our <span>Gallery</span></h2>
            <div class="view-all">
                <p>View All </p>
            </div>
        </div>

        <!-- Image Grid -->
        <div class="gallery-grid">
            <img src="image/breads-1867459_1280.jpg" alt="Gallery Image 1">
            <img src="image/about image 5.jpg" alt="Gallery Image 2">
            <img src="image/About image 1.jpg" alt="Gallery Image 3">
            <img src="image/about image 2.jpg" alt="Gallery Image 4">
            <img src="image/about image 3.jpg" alt="Gallery Image 5">
            <img src="image/about image 6.jpg" alt="Gallery Image 6">
        </div>
    </section>


    <script>
        // Array of image sources
        var images = ["image/about us 1.png", "image/about us 2.png", "image/about us 3.png", "image/about us 4.png","image/about us 6.png"]; // Add your image paths here
        var currentIndex = 0;
    
        function changeImage() {
            currentIndex = (currentIndex + 1) % images.length; // Loop through images
            document.getElementById("sliderImage").src = images[currentIndex];
        }
    
        // Change image every 3 seconds
        setInterval(changeImage, 3000);
    </script>

<jsp:include page = "footer.jsp"/>
</body>
</html>
