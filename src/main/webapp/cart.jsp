<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="freshco.Beans.CartProducts"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Fresh Co</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        /* Your existing styles */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header-container h1 {
            font-size: 24px;
        }

        .continue-shopping {
            text-decoration: none;
            color: #3498db;
        }

        .cart-section {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table {
            width: 100%;
            border: 1px solid #ddd;
        }

        .cart-table th,
        .cart-table td {
            padding: 10px;
            text-align: left;
        }

        .cart-table th {
            background-color: #f2f2f2;
        }

        .cart-image {
            width: 100px; /* Set a width for the images */
            height: auto; /* Maintain aspect ratio */
        }

        .remove-button,
        .clear-button,
        .checkout-button {
            padding: 8px 12px;
            border: none;
            background-color: #e74c3c;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .remove-button:hover,
        .clear-button:hover,
        .checkout-button:hover {
            background-color: #c0392b;
        }

        .cart-actions {
            margin-top: 20px;
        }

        .cart-actions form {
            display: inline-block;
            margin-right: 10px;
        }
    </style>
</head>

<body>

    <header>
        <div class="header-container">
            <h1>Your Shopping Cart</h1>
            <a href="Shop" class="continue-shopping">Continue Shopping</a>
        </div>
    </header>

    <section class="cart-section">
        <table class="cart-table">
            <tr>
                <th>Image</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Discount (%)</th>
                <th>Net Price</th>
                <th>Action</th>
            </tr>
            <%
            @SuppressWarnings("unchecked")
                List<CartProducts> cartItems = (List<CartProducts>) request.getAttribute("cartItems");
                double totalDiscount = 0; // Initialize total discount
                double totalPayable = 0; // Initialize total payable amount

                if (cartItems != null && !cartItems.isEmpty()) {
                    for (CartProducts item : cartItems) {
                        try {
                            double originalPrice = item.getNetPrice(); // Get the price per item
                            int quantity = Math.max(1, item.getQuantity());
                            originalPrice = originalPrice * quantity;
                            double discount = item.getDiscount(); // Get the discount percentage
                            double discountAmount = originalPrice * (discount / 100); // Calculate discount amount
                            double netPrice = originalPrice - discountAmount; // Calculate net price after discount

                            // Ensure quantities are valid
                             // At least 1 quantity

                            totalDiscount += discountAmount; // Calculate total discount
                            totalPayable += netPrice; // Calculate total payable amount
            %>
            <tr>
                <td>
                    <img src="<%= item.getImgUrl() %>" alt="<%= item.getProductName() %>" class="cart-image"> <!-- Display image -->
                </td>
                <td><%= item.getProductName() %></td>
                <td><%= quantity %></td>
                <td>$<%= String.format("%.2f", originalPrice) %></td> <!-- Display original price -->
                <td><%= String.format("%.2f", discount) %></td> <!-- Display discount percentage -->
                <td>$<%= String.format("%.2f", netPrice) %></td> <!-- Display net price -->
                <td>
                    <form action="RemoveCart" method="post">
                        <input type="hidden" name="pid" value="<%= item.getPid() %>">
                        <button type="submit" class="remove-button">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                        } catch (Exception e) {
                            // Log the exception (optional) and ignore it to continue processing
                            // System.out.println("Error processing item: " + e.getMessage());
                        }
                    }
            %>
            <tr>
                <td colspan="4"><strong>Total Discount</strong></td>
                <td>$<%= String.format("%.2f", totalDiscount) %></td>
                <td colspan="2"><strong>Total Payable</strong>: $<%= String.format("%.2f", totalPayable) %></td>
            </tr>
            <%
                } else {
            %>
            <tr>
                <td colspan="7">Your cart is empty.</td>
            </tr>
            <%
                }
            %>
        </table>

    <%
    String userType = (String) session.getAttribute("userType"); // Assuming userType is stored in session
%>
<div class="cart-actions">
    <form action="ClearCart" method="post">
        <button type="submit" class="clear-button">Clear Cart</button>
    </form>

    <% if ("Customer".equals(userType)) { %>
        <form action="Checkout" method="get">
            <input type="hidden" name="totalDiscount" value="<%= String.format("%.2f", totalDiscount) %>">
            <input type="hidden" name="totalPayable" value="<%= String.format("%.2f", totalPayable) %>">
            
            <% 
                if (cartItems != null && !cartItems.isEmpty()) {
                    for (CartProducts item : cartItems) {
            %>
                <input type="hidden" name="productId" value="<%= item.getPid() %>">
                <input type="hidden" name="productName" value="<%= item.getProductName() %>">
                <input type="hidden" name="productQuantity" value="<%= item.getQuantity() %>">
                <input type="hidden" name="productPrice" value="<%= String.format("%.2f", item.getNetPrice()) %>">
                <input type="hidden" name="productDiscount" value="<%= String.format("%.2f", item.getDiscount()) %>">
                <input type="hidden" name="productImage" value="<%= item.getImgUrl() %>">
            <% 
                    }
                } 
            %>
            <button type="submit" class="checkout-button">Checkout</button>
        </form>
    <% } else { %>
        
            <h3 class="checkout-button">Login as Customer</h3>
        
          <% } %>
</div>

    </section>

</body>
</html>
