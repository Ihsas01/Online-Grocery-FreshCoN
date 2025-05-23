<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="freshco.Model.ProductDBUtil" %>
<%@ page import="freshco.Beans.Product" %>
<%@ page import="freshco.Beans.Category" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshCo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, rgb(46, 45, 45), #504e4e);
        }
        
        .main-box {
            display: flex;
            flex-direction: column;
            width: 600px;
            max-width: 1200px;
            margin: 40px auto;
            background: linear-gradient(to right, #cbd4cb, #c9cec7);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        .profile-header {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.6);
        }
        
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 10%;
            margin-bottom: 15px;
            object-fit: cover;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            border: 3px solid #5f2c84;
            transition: transform 0.3s ease;
        }
        
        .profile-pic:hover {
            transform: scale(1.05);
        }
        
        .drag-drop-area {
            width: 150px;
            height: 150px;
            border: 2px dashed #5f2c84;
            border-radius: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .drag-drop-area:hover {
            background-color: rgba(95, 44, 132, 0.1);
        }
        
        .upload-btn {
            display: none;
        }
        
        .main-form {
            padding: 40px;
        }
        
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        
        .group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }
        
        .group input {
            width: 80%;
            padding: 12px;
            padding-left: 35px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .group input:focus {
            border-color: #5f2c84;
            box-shadow: 0 0 8px rgba(95, 44, 132, 0.2);
            outline: none;
        }
        
        .group .fa {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        
        .save-btn {
            background-color: #5f2c84;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 100%;
            max-width: 250px;
            align-self: center;
        }
        
        .save-btn:hover {
            background-color: #4a206a;
        }
        
        .loading-spinner {
            display: none;
            margin-left: 10px;
            border: 2px solid white;
            border-top: 2px solid transparent;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }
        
        @media (max-width: 768px) {
            .main-box {
                flex-direction: column;
                box-shadow: none;
            }
            .main-form {
                padding: 20px;
            }
        }
        
        .file-input {
            display: none;
        }

        select {
            width: 130px;
            height: 30px;
            border-radius: 5px;
            padding-left: 10px;
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
    <div class="main-box">
        <div class="profile-header">
            <h2>Add Product</h2>
        </div>

        <div class="main-form">
            
           <form id="profileForm" action="AddProducts" method="post" enctype="multipart/form-data">
    <div class="group">
        <label for="productName">Product Name</label>
        <input type="text" id="productName" name="productName" placeholder="Product Name" required>
    </div>
    <div class="group">
        <label for="descript">Description</label>
        <input type="text" id="descript" name="descript" placeholder="Description" required>
    </div>
    <div class="group">
        <label for="price">Price</label>
        <input type="number" id="price" name="price" step="0.01" min="0" placeholder="Price" required>
    </div>
    <div class="group">
        <label for="unit">Unit</label>
        <input type="text" id="unit" name="unit" placeholder="Unit" required>
    </div>
    <div class="group">
        <label for="quantity">Quantity</label>
        <input type="number" id="quantity" name="quantity" placeholder="Quantity" required>
    </div>
    <div class="group">
        <label for="imgUrl">Image</label>
        <input type="file" id="imgUrl" name="imgUrl" accept="image/*" required>
    </div>
    <div class="group">
        <label for="discount">Discount</label>
        <input type="number" id="discount" name="discount" step="0.01" min="0" placeholder="Discount" required>
    </div>
    <div class="group">
        <label for="CID">Category ID</label>
        <select name="CID" id="CID" required>
            <option value="" disabled selected>Select a category</option>
            <%-- Populate options dynamically --%>
            <%
                try {
                	@SuppressWarnings("unchecked")
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    if (categories != null) {
                        for (Category cat : categories) {
            %>
            <option value="<%= cat.getCID() %>"><%= cat.getCategory_Name() %></option>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
    </div>
    <button type="submit" class="save-btn">Save</button>
    <button type="button" class="save-btn" onclick="history.back();">Back</button>
</form>


             
        </div>
    </div>

   

</body>

</html>
    