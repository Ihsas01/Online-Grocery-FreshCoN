<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Your Experience</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            color: #333;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
        }

        .card {
            background-color: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 15px;
            font-weight: 500;
        }

        p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 20px;
        }

        .comment-box {
            width: 100%;
            margin-bottom: 20px;
        }

        textarea {
            width: 100%;
            height: 100px;
            padding: 15px;
            border-radius: 12px;
            border: 1px solid #ddd;
            resize: none;
            font-family: 'Roboto', sans-serif;
            font-size: 1rem;
            margin-bottom: 20px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        textarea:focus {
            border-color: #74ebd5;
        }

        .stars {
            margin-bottom: 20px;
        }

        .star {
            font-size: 2.5rem;
            color: #d3d3d3;
            cursor: pointer;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .star:hover,
        .star.active {
            color: #ffc107;
            transform: scale(1.1);
        }

        .submit-btn {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            color: white;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #feb47b, #ff7e5f);
            transform: scale(1.05);
        }

        .success-message {
            display: none;
            margin-top: 20px;
            color: green;
            font-size: 1.2rem;
            font-weight: bold;
        }
    </style>
    <script>
        function confirmSubmission() {
            return confirm("Are you sure you want to submit the response?");
        }
    </script>
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
    <div class="container">
        <!-- Form that submits to server -->
        <form action="Feedbackform" method="post" onsubmit="return confirmSubmission();">
            <div class="card">
                <h2>Rate Your Experience</h2>
                <p>Your feedback helps us improve</p>
                <div class="comment-box">
                    <textarea id="comment" placeholder="Leave a comment..." name="comments" required></textarea>
                </div>
                <div class="stars">
                    <i class="star" data-value="1">&#9733;</i>
                    <i class="star" data-value="2">&#9733;</i>
                    <i class="star" data-value="3">&#9733;</i>
                    <i class="star" data-value="4">&#9733;</i>
                    <i class="star" data-value="5">&#9733;</i>
                </div>
				
                <input type="hidden" name="rating" id="rating" value="0" />
                <input type="hidden" name="oID" value="<%= request.getParameter("OID") %>" />
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>

    <script>
        // Select elements
        const stars = document.querySelectorAll('.star');
        const ratingInput = document.getElementById('rating');
        let selectedRating = 0;

        // Add click event listener to each star
        stars.forEach((star, index) => {
            star.addEventListener('click', () => {
                // Remove active class from all stars
                stars.forEach(star => star.classList.remove('active'));

                // Add active class to the clicked star and all previous stars
                for (let i = 0; i <= index; i++) {
                    stars[i].classList.add('active');
                }

                // Set selected rating value
                selectedRating = star.getAttribute('data-value');
                ratingInput.value = selectedRating;  // Set the hidden input 
            });
        });
    </script>

</body>

</html>
