<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="freshco.Model.ProductDBUtil" %>
<%@ page import="freshco.Beans.Product" %>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <title>Fresh Co</title>
    <style>
      #main{
       padding-top: 2%;
   margin-top: 2%;
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
    <jsp:include page="Dash.jsp"/>
<%
	HttpSession sess = request.getSession(false); // Get the session without creating a new one
	String userType = (String) sess.getAttribute("userType"); // Get userType from the session

	if (userType != null && userType.equals("Manager")) {
	%>
<div id="main">
<h1 class="title-sec">Product</h1>
<hr>
<div class="top-container">
    <div class="top-in-container">
        <button class="button-top" onclick="window.location.href='ProductForm'">Add New Products</button>

        
    </div>
</div>
<hr>
    <section class="table-container">
    <div class="table-wrapper">
    <script>
        $(document).ready(function() {
            $('#myTable').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                scrollX: true,
                columnDefs: [
                    { orderable: false, targets: -1 }
                ],
                language: {
                    paginate: {
                        previous: "<",
                        next: ">"
                    }
                }
            });
        });
    </script>
        <table id="myTable" class="display nowrap" style="width:100%">
             <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Unit</th>
                    <th>Quantity</th>
                    <th>imgUrl</th>
                    <th>Discount</th>
                    <th>CID</th>
                    <th>Action</th>
                </tr>
                 
            </thead>
           <tbody>
               <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Product> products = (List<Product>)request.getAttribute("products");
                        if (products != null) {
                            for (Product pro : products) {
                    %>
                    <tr>
                        <td><%= pro.getPrID() %></td>
                        <td><%= pro.getProductName() %></td>
                        <td><%= pro.getDescript() %></td>
                        <td><%= pro.getPrice() %></td>
                        <td><%= pro.getUnit() %></td>
                        <td><%= pro.getQuantity() %></td>
                        <td><%= pro.getImgUrl() %></td>
                        <td><%= pro.getDiscount() %></td>
                        <td><%= pro.getCID() %></td>
                        <td><a href="DataPro?PrID=<%= pro.getPrID() %>"><span class="material-symbols-outlined">edit</span></a>
                        <a href="DeletePro?PrID=<%= pro.getPrID() %>" onclick="return confirmDelete();"><span class="material-symbols-outlined">delete</span></a></td>
                        
                    <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        </div>
    </section>
</div>
	<%
	} else if (userType != null && userType.equals("Employee")) {
	%>
	<div id="main">
<h1 class="title-sec">Product</h1>
<hr>
<div class="top-container">
    <div class="top-in-container">
        <button class="button-top" onclick="window.location.href='ProductForm'">Add New Products</button>

        
    </div>
</div>
<hr>
    <section class="table-container">
    <div class="table-wrapper">
    <script>
        $(document).ready(function() {
            $('#myTable').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                scrollX: true,
                columnDefs: [
                    { orderable: false, targets: -1 }
                ],
                language: {
                    paginate: {
                        previous: "<",
                        next: ">"
                    }
                }
            });
        });
    </script>
        <table id="myTable" class="display nowrap" style="width:100%">
             <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Unit</th>
                    <th>Quantity</th>
                    <th>imgUrl</th>
                    <th>Discount</th>
                    <th>CID</th>
                    <th>Action</th>
                </tr>
                
            </thead>
           <tbody>
               <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Product> products = (List<Product>)request.getAttribute("products");
                        if (products != null) {
                            for (Product pro : products) {
                    %>
                    <tr>
                        <td><%= pro.getPrID() %></td>
                        <td><%= pro.getProductName() %></td>
                        <td><%= pro.getDescript() %></td>
                        <td><%= pro.getPrice() %></td>
                        <td><%= pro.getUnit() %></td>
                        <td><%= pro.getQuantity() %></td>
                        <td><%= pro.getImgUrl() %></td>
                        <td><%= pro.getDiscount() %></td>
                        <td><%= pro.getCID() %></td>
                        <td><a href="DataPro?PrID=<%= pro.getPrID() %>"><span class="material-symbols-outlined">edit</span></a>
                        <a href="DeletePro?PrID=<%= pro.getPrID() %>" onclick="return confirmDelete();"><span class="material-symbols-outlined">delete</span></a></td>
                        
                    <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        </div>
    </section>
</div>
<%
	} else {
	%>
	<h2>Access Denied</h2>
	<p>You do not have permission to view this content.</p>
	<%
	}
	%>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
   <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete your Product? This action cannot be retrieved");
    }
</script>
</body>
</html>
