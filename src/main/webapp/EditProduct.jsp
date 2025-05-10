<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            background-image: url(/image/5786039.jpg);
            background-repeat: no-repeat;
            background-size: cover;
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
        
        .product-header {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.6);
        }
        
        .product-image {
            width: 150px;
            height: 150px;
            border-radius: 10px;
            margin-bottom: 15px;
            object-fit: cover;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            border: 3px solid #5f2c84;
            transition: transform 0.3s ease;
        }
        
        .areas {
            width: 150px;
            height: 150px;
            border: 2px dashed #5f2c84;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .areas:hover {
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
        
        .sub_part {
            margin-bottom: 20px;
            position: relative;
        }
        
        .sub_part label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }
        
        .sub_part input,
        .sub_part textarea {
            width: 80%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .sub_part textarea {
            resize: vertical;
            height: 100px;
        }
        
        .sub_part input:focus,
        .sub_part textarea:focus {
            border-color: #5f2c84;
            box-shadow: 0 0 8px rgba(95, 44, 132, 0.2);
            outline: none;
        }
        
        .sub_part input:invalid {
            border-color: red;
        }
        
        .sub_part .fa {
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
        
        .save-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
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
        <form id="productForm" action="EditProduct" method="post" enctype="multipart/form-data">
            <div class="product-header">
                <h2>Edit Product</h2>
           		   </div>

            <div class="main-form">
                <div class="sub_part">
                <input type="hidden" name="PrID" value="${product.prID}">
                    <label for="productName">Product Name</label>
                    <i class="fa fa-tag"></i>
                    <input type="text" id="productName" name="productName" value="${product.productName}" placeholder="Enter Product Name" required>
                </div>
                <div class="sub_part">
                    <label for="productDescription">Product Description</label>
                    <i class="fa fa-info-circle"></i>
                    <textarea id="productDescription" name="descript" placeholder="Enter Product Description" required>${product.descript}</textarea>
                </div>
                <div class="sub_part">
				<label for="imgUrl">Image</label>
        		<input type="file" id="imgUrl" name="imgUrl" accept="image/*" value="${product.imgUrl}" required>
         </div>
                <div class="sub_part">
                    <label for="price">Price</label>
                    <i class="fa fa-dollar-sign"></i>
                    <input type="number" id="price" name="price" value="${product.price}" placeholder="Enter Price" required>
                </div>

                <div class="sub_part">
                    <label for="quantity">Quantity</label>
                    <i class="fa fa-box"></i>
                    <input type="number" id="quantity" name="quantity" value="${product.quantity}" placeholder="Enter Quantity" required>
                </div>
                <div class="sub_part">
                    <label for="quantity">Discount</label>
                    <i class="fa fa-box"></i>
                    <input type="number" id="discount" name="discount" value="${product.discount}" placeholder="Enter Quantity" required>
                </div>
                
                <button type="submit" class="save-btn" id="saveBtn">
                    Save Product
                </button>
				
            </div>
        </form>
    </div>
</body>

</html>
