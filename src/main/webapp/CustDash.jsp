<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="freshco.Model.CustomerDBUtil" %>
<%@ page import="freshco.Beans.Customer" %>
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
 <jsp:include page="Dash.jsp"/>
<div id="main">
<h1 class="title-sec">Customer</h1>
   <hr>
<div class="top-container">
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
                    <th>CusID</th>
                    <th>First_Name</th>
                    <th>Last_Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Lane</th>
                    <th>City</th>
                    <th>Date Of Birth</th>
                    <th>Image</th>
                   
                    
                </tr>
            </thead>
            <tbody>
                 <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                        if (customers != null) {
                        for (Customer cus : customers) {
                    %>
                    <tr>
                        <td><%= cus.getCusID() %></td>
                        <td><%= cus.getfName() %></td>
                        <td><%= cus.getlName() %></td>
                        <td><%= cus.getEmail() %></td>
                         <td><%= cus.getPhone() %></td>
                        <td><%= cus.getLane() %></td>
                        <td><%= cus.getCity() %></td>
                        <td><%= cus.getDob() %></td>
                        <td><img src="<%= cus.getImgUrl() %>" alt="<%= cus.getfName() %> + <%= cus.getlName() %>" style="width: 100px; height: auto;"></td>
 
                    </tr>
                    <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
        </div>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>
  
</body>
</html>
