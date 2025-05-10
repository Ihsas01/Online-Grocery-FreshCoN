<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.AdminDBUtil" %>
<%@ page import="freshco.Beans.Admin" %>
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
        #main {
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
<jsp:include page = "Dash.jsp"/>

<div id="main">
    <h1 class="title-sec">Admin</h1>
    <hr>
    
    <div class="top-container">
        <div class="top-in-container">
            <button class="button-top" onclick="window.location.href='AdminRegistration.jsp'">Add New Admin</button>
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
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Lane</th>
                        <th>City</th>
                        <th>DOB</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try {
                    	@SuppressWarnings("unchecked")
                    	List<Admin> admin = (List<Admin>) request.getAttribute("admins");
                        if (admin != null) {
                        for (Admin adm : admin) {
                    %>
                    <tr>
                    	<td><%= adm.getAID() %></td>
                        <td><%= adm.getfName() %></td>
                        <td><%= adm.getlName() %></td>
                        <td><%= adm.getEmail()%></td>
                        <td><%= adm.getLane() %></td>
                        <td><%= adm.getCity() %></td>
                        <td><%= adm.getDob() %></td>
                        <td><%= adm.getPhone() %></td>
                    </tr>
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

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
