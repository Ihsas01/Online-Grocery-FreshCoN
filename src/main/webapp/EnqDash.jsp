<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="freshco.Model.EnquiryDBUtil" %>
<%@ page import="freshco.Beans.Enquiry" %>
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
 <%
	HttpSession sess = request.getSession(false); // Get the session without creating a new one
	String userType = (String) sess.getAttribute("userType"); // Get userType from the session

	if (userType != null && userType.equals("Manager")) {
	%>
<div id="main">
<h1 class="title-sec">Enquiry</h1>
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
                    <th>Enquiry_ID</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Comments</th>
                    <th>Response</th>
                    <th>Action</th>
                    
                </tr>
            </thead>
            <tbody>
               <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Enquiry> enquiry = (List<Enquiry>) request.getAttribute("enquiry");
                        if (enquiry != null) {
                        for (Enquiry enq : enquiry) {
                    %>
                    <tr>
                        <td><%= enq.getEnID() %></td>
                        <td><%= enq.getEmail() %></td>
                        <td><%= enq.getSubject() %></td>
                        <td><%= enq.getComments() %></td>
                        <td><%= enq.getResponse() %></td>
                        <td>                        
<% 
    // Check if the response is null or empty
    if (enq.getResponse() == null || enq.getResponse().isEmpty()) { 
%>
    <!-- Show feedback link if response is not provided -->
    <a href="Response.jsp?EnID=<%= enq.getEnID() %>">
        <span class="material-symbols-outlined">message</span>
    </a>
<% 
    } else { 
%>
    Responded
<% 
    } 
%>   
    </td>
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
  
</body>
</html>
