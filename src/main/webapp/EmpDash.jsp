<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.EmployeeDBUtil"%>
<%@ page import="freshco.Beans.Employee"%>
<%@ page import="freshco.Beans.DeliveryPerson"%>
<%@ page import="freshco.Beans.Manager"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<title>Fresh Co</title>
<style type="text/css">
#main {
	padding-top: 2%;
	margin-top: 2%;
}
</style>
</head>

<body>
	<jsp:include page="Dash.jsp" />

	<%
	HttpSession sess = request.getSession(false); // Get the session without creating a new one
	String userType = (String) sess.getAttribute("userType"); // Get userType from the session

	if (userType != null && userType.equals("Manager")) {
	%>
	<div id="main">
		<h1 class="title-sec">Employee</h1>
		<hr>

		<div class="top-container">
			<div class="top-in-container">
				<button class="button-top"
					onclick="window.location.href='EmployeeDPRegistration.jsp'">Driver
					Registration form</button>
				<button class="button-top"
					onclick="window.location.href='EmployeeManRegistration.jsp'">Add
					New Employee</button>


			</div>
		</div>
		<hr>
		<section class="table-container">
			<div class="table-wrapper">
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#myTable')
												.DataTable(
														{
															paging : true,
															searching : true,
															ordering : true,
															info : true,
															scrollX : true,
															columnDefs : [ {
																orderable : false,
																targets : -1
															} ],
															language : {
																paginate : {
																	previous : "<",
                                next: ">"
																}
															}
														});
									});
				</script>
				<table id="myTable" class="display nowrap" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Email</th>
							<th>NIC</th>
							<th>DOB</th>
							<th>Phone</th>
							<th>Vehicle Number</th>
							<!-- New column for Vehicle Number -->
							<th>Driving License Number</th>
							<!-- New column for Driving License Number -->
							<th>City</th>
							<!-- New column for City -->
							<th>Role</th>
							<!-- New column for Role -->
						</tr>
					</thead>
					<tbody>
						<%
						try {
							@SuppressWarnings("unchecked")
							List<Employee> employees = (List<Employee>) request.getAttribute("employees");
							if (employees != null) {
								for (Employee emp : employees) {
							String vehicleNum = null;
							String drivingLicenseNum = null;
							String city = null;
							String role = "Employee"; // Default role

							// Check the type of employee and set the role and vehicle details accordingly
							if (emp instanceof Manager) {
								role = "Manager"; // Role is Manager
							} else if (emp instanceof DeliveryPerson) {
								DeliveryPerson deliveryPerson = (DeliveryPerson) emp; // Cast to DeliveryPerson
								vehicleNum = deliveryPerson.getVehicleNum();
								drivingLicenseNum = deliveryPerson.getDrivingLicenseNum();
								city = deliveryPerson.getCity();
								role = "Delivery Person"; // Role is Delivery Person
							}
						%>
						<tr>
							<td><%=emp.getEmID()%></td>
							<td><%=emp.getEmail()%></td>
							<td><%=emp.getNic()%></td>
							<td><%=emp.getDob()%></td>
							<!-- Format DOB -->
							<td><%=emp.getPhone()%></td>
							<td><%=vehicleNum != null ? vehicleNum : "N/A"%></td>
							<!-- Vehicle Number -->
							<td><%=drivingLicenseNum != null ? drivingLicenseNum : "N/A"%></td>
							<!-- Driving License Number -->
							<td><%=city != null ? city : "N/A"%></td>
							<!-- City -->
							<td><%=role%></td>
							<!-- Role -->
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

				<%
				} else if (userType != null && userType.equals("Admin")) {
				%>
				<div id="main">
					<h1 class="title-sec">Employee</h1>
					<hr>

					<div class="top-container">
						<div class="top-in-container"></div>
					</div>
					<hr>
					<section class="table-container">
						<div class="table-wrapper">
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													$('#myTable')
															.DataTable(
																	{
																		paging : true,
																		searching : true,
																		ordering : true,
																		info : true,
																		scrollX : true,
																		columnDefs : [ {
																			orderable : false,
																			targets : -1
																		} ],
																		language : {
																			paginate : {
																				previous : "<",
                                next: ">"
																			}
																		}
																	});
												});
							</script>
							<table id="myTable" class="display nowrap" style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>Email</th>
										<th>NIC</th>
										<th>DOB</th>
										<th>Phone</th>
										<th>Vehicle Number</th>
										<!-- New column for Vehicle Number -->
										<th>Driving License Number</th>
										<!-- New column for Driving License Number -->
										<th>City</th>
										<!-- New column for City -->
										<th>Role</th>
										<!-- New column for Role -->
									</tr>
								</thead>
								<tbody>
									<%
									try {
										@SuppressWarnings("unchecked")
										List<Employee> employees = (List<Employee>) request.getAttribute("employees");
										if (employees != null) {
											for (Employee emp : employees) {
										String vehicleNum = null;
										String drivingLicenseNum = null;
										String city = null;
										String role = "Employee"; // Default role

										// Check the type of employee and set the role and vehicle details accordingly
										if (emp instanceof Manager) {
											role = "Manager"; // Role is Manager
										} else if (emp instanceof DeliveryPerson) {
											DeliveryPerson deliveryPerson = (DeliveryPerson) emp; // Cast to DeliveryPerson
											vehicleNum = deliveryPerson.getVehicleNum();
											drivingLicenseNum = deliveryPerson.getDrivingLicenseNum();
											city = deliveryPerson.getCity();
											role = "Delivery Person"; // Role is Delivery Person
										}
									%>
									<tr>
										<td><%=emp.getEmID()%></td>
										<td><%=emp.getEmail()%></td>
										<td><%=emp.getNic()%></td>
										<td><%=emp.getDob()%></td>
										<!-- Format DOB -->
										<td><%=emp.getPhone()%></td>
										<td><%=vehicleNum != null ? vehicleNum : "N/A"%></td>
										<!-- Vehicle Number -->
										<td><%=drivingLicenseNum != null ? drivingLicenseNum : "N/A"%></td>
										<!-- Driving License Number -->
										<td><%=city != null ? city : "N/A"%></td>
										<!-- City -->
										<td><%=role%></td>
										<!-- Role -->
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
					<jsp:include page="footer.jsp" />
				</footer>

			</div>
		</section>
	</div>
</body>
</html>
