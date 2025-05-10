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
            background-color: #f4f4f4;
            margin: 0;
            
        }
        .QA-header {
            background-color: #f0f0f0;
            padding: 20px 0;
            text-align: center;
        }
        .QA-header h1 {
            font-size: 2.5em;
            margin: 0;
            color: #333;
        }
        .QAbreadcrumb {
            margin-top: 10px;
            font-size: 1.2em;
            color: #555;
        }
        .QAbreadcrumb a {
            color: #666;
            text-decoration: none;
        }
        .QAbreadcrumb a:hover {
            text-decoration: underline;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .faq-container {
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .question {
            background: #007bff;
            color: #fff;
            padding: 15px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .question:hover {
            background: #0056b3;
        }

        .answer {
            display: none;
            padding: 15px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Frequently Asked Questions</h1>


<div class="faq-container">
    <div class="question">1. How can I create an account?</div>
    <div class="answer">To create an account, click on the 'Sign Up' button on the homepage and fill in your details.</div>

    <div class="question">2. How do I place an order?</div>
    <div class="answer">Browse through the categories, add items to your cart, and click 'Checkout' to place your order.</div>

    <div class="question">3. What payment methods do you accept?</div>
    <div class="answer">We accept credit/debit cards, PayPal, and cash on delivery (available in select areas).</div>

    <div class="question">4. How do I track my order?</div>
    <div class="answer">You can track your order in the 'My Orders' section after logging into your account.</div>

    <div class="question">5. Can I cancel or modify my order?</div>
    <div class="answer">Yes, you can cancel or modify your order before it is shipped. Visit the 'My Orders' section.</div>

    <div class="question">6. Is there a delivery fee?</div>
    <div class="answer">Delivery fees vary depending on your location and the total order amount. Orders above $50 qualify for free delivery.</div>

    <div class="question">7. Do you offer same-day delivery?</div>
    <div class="answer">Yes, we offer same-day delivery for orders placed before noon.</div>

    <div class="question">8. How do I return a product?</div>
    <div class="answer">To return a product, contact customer service, and they will guide you through the process.</div>

    <div class="question">9. Are your products organic?</div>
    <div class="answer">We offer a wide range of organic products, which you can find in the 'Organic' section of the store.</div>

    <div class="question">10. Do you offer customer support?</div>
    <div class="answer">Yes, our customer support is available 24/7. You can reach us via phone, email, or live chat.</div>
</div>

<script>
    const questions = document.querySelectorAll('.question');

    questions.forEach((question) => {
        question.addEventListener('click', () => {
            const answer = question.nextElementSibling;
            const isOpen = answer.style.display === 'block';
            answer.style.display = isOpen ? 'none' : 'block';
        });
    });
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>
