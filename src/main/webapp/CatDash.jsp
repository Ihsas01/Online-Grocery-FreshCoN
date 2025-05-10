<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.CategoryDBUtil"%>
<%@ page import="freshco.Beans.Category"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <title>FreshCo</title>
    <style>
        #main{
       padding-top: 2%;
   margin-top: 2%;
      }
    </style>
</head>

<body>
 <jsp:include page="Dash.jsp"/>
 <%
	HttpSession sess = request.getSession(false); // Get the session without creating a new one
	String userType = (String) sess.getAttribute("userType"); // Get userType from the session

	if (userType != null && userType.equals("Manager") || userType.equals("Employee")) {
	%>
<div id="main">
<h1 class="title-sec">Category</h1>
   <hr>
<div class="top-container">
    <div class="top-in-container">
       <button class="button-top" onclick="window.location.href='AddCategories.jsp'">Add New Categories</button>


        
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
                    <th>Category Name</th>
                    <th>ImgUrl</th>
                   	<th>Action</th>
                     </tr>
            </thead>
           <tbody>
                 <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Category> categories = (List<Category>)request.getAttribute("categories");
                        if (categories != null) {
                            for (Category cat : categories) {
                    %>
                    <tr>
                        <td><%= cat.getCID() %></td>
                         <td><%= cat.getCategory_Name() %></td>
                         <td><img src="<%= cat.getImgUrl() %>" alt="<%= cat.getCategory_Name() %>" style="width: 100px; height: auto;"></td>
                        <td><a href="DeleteCategories?CID=<%= cat.getCID() %>" onclick="return confirmDelete();"><span class="material-symbols-outlined">delete</span></a></td>
                        
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
        							<%
							} else {
							%>
							<h2>Access Denied</h2>
							<p>You do not have permission to view this content.</p>
							<%
							}
							%>
        </div>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>
  
  <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete your Category? This action will delete all the products under the Category.");
    }
</script>
</body>
</html>
