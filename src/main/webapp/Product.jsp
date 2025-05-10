<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="freshco.Model.ProductDBUtil" %>
<%@ page import="freshco.Beans.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <style>
        /* CSS Styles for the Product Page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9; /* Light background color */
        }

        .header {
            background-color: #4caf50; /* Fresh green color */
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header h1 {
            margin: 0;
            font-size: 1.8rem; /* Header font size */
        }

        .search-container {
            display: flex;
            align-items: center;
        }

        .search-container input[type="text"] {
            padding: 10px;
            border: 1px solid #388e3c; /* Darker green border */
            border-radius: 5px;
            margin-right: 5px;
        }

        .search-container button {
            padding: 10px;
            background-color: #388e3c; /* Darker green button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-container button:hover {
            background-color: #45a049; /* Slightly darker green on hover */
        }
        
        #product{

   display: flex;
   flex-direction: column;
   max-width: 1000px;
   margin: 50px auto ;
   margin: 80px auto;

}

        .product-cantainer{
   display: grid;
   grid-template-columns: 1fr 1fr 1fr ;
   grid-gap:30px;
   margin: 40px 0px;
   
}
.product-box{
   width: 250px;
   border: 1px solid #eeeeee;
   background-color: #ffffff;
   padding: 20px;
   border-radius: 20px;
   display:flex ;
   flex-direction:column ;

}

.product-box img{
   width: 90%;
   height: 180px;
   object-fit: contain;
   margin: auto;
}
.product-box strong{
   color: #202020;
   font-size: 1.1rem;
   letter-spacing: 1px;
   font-weight: 600;
   margin-top: 10px;


}
.product-box .Quantity{
   color: #949494;
   font-size: 0.8rem;
   font-weight: 500;
   letter-spacing: 1px;

}
.product-box .price{
   margin-top: 10px;
   color: #393939;
   font-size: 1.3rem;
   font-weight: 600;
   

}

        .product-box .cart-button {
            width: 100%;
            height: 40px;
            background-color: #4caf50; /* Green background */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 15px; /* Space above button */
            transition: background-color 0.3s;
            cursor: pointer;
            border: none;
            border-radius: 5px; /* Rounded corners */
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .product-box {
                width: calc(50% - 30px); /* Two items per row on smaller screens */
            }
        }

        @media (max-width: 480px) {
            .product-box {
                width: 100%; /* Full width on very small screens */
            }
        }
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
    
    <div class="header">
        <h1>Fresh Co</h1>
        <div class="search-container">
            <form action="" method="GET">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit">Search</button>
            </form>
        </div>
        <label for="category">Choose a category: </label>
        <select id="category" name="category">
            <option value="fruits">Fruits</option>
            <option value="vegetables">Vegetables</option>
            <option value="meats">Meats</option>
            <option value="soft-drinks">Soft Drinks</option>
        </select>
    </div>
    
    
 <section id="product">

    <div class="product-cantainer">
        <%
            try {
            	@SuppressWarnings("unchecked")
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product pro : products) {
        %>
            <div class="product-box">
                <img src="<%= pro.getImgUrl() %>" alt="<%= pro.getProductName() %>" />
                <strong><%= pro.getProductName() %></strong>
                <span class="Quantity"><%= pro.getUnit() %></span>
                <span class="price">Price: $<%= pro.getPrice() %></span>
                <!-- Form for adding to cart -->
               <form action="AddCart" method="POST">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="imgUrl" value="<%= pro.getImgUrl() %>">
    <input type="hidden" name="discount" value="<%= pro.getDiscount() %>">
    <input type="hidden" name="productName" value="<%= pro.getProductName() %>">
    <input type="hidden" name="netPrice" value="<%= pro.getPrice() %>">
    <input type="hidden" name="pid" value="<%= pro.getPrID() %>">
    <input type="number" name="quantity" min="1" value="1" max="<%= pro.getQuantity() %>" class="quantity-input" />
    <input type="submit" value="Add to Cart" class="cart-button" />
</form>

            </div>
        <%
                    }
                } else {
                    out.println("<p>No products available</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error retrieving products</p>");
            }
        %>
    </div>
    
    
  </section>

    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
</body>

</html>
