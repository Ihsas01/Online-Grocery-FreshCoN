package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.Admin;
import freshco.Beans.Customer;
import freshco.Beans.DeliveryPerson;
import freshco.Beans.Employee;
import freshco.Beans.Manager;
import freshco.Model.AdminDBUtil;
import freshco.Model.CustomerDBUtil;
import freshco.Model.DeliveryPersonDBUtil;
import freshco.Model.EmployeeDBUtil;
import freshco.Model.ManagerDBUtil;


public class UserValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
		Employee isEmpVal = EmployeeDBUtil.validateEmployee(email, password);
		Customer isCusVal = CustomerDBUtil.validateCustomer(email, password);
		Admin isAdmVal = AdminDBUtil.validateAdmin(email, password);
		
		HttpSession sess = request.getSession(false);
		
		if (sess == null) {
			  // No session exists, create a new one
            sess = request.getSession();
            sess.setMaxInactiveInterval(30 * 60); // Optional: Set session timeout to 30 minutes
        }
		
		if (isEmpVal != null) {
			Manager isManVal = ManagerDBUtil.validateManager(email, password);
			DeliveryPerson isDPsnVal = DeliveryPersonDBUtil.validateDeliveryPerson(email, password);
	       
		 if (isManVal != null) {
			sess.setAttribute("ID", isManVal.getEmID());
	        sess.setAttribute("email", isManVal.getEmail());
	        sess.setAttribute("nic", isManVal.getNic());
	        sess.setAttribute("dob", isManVal.getDob());
	        sess.setAttribute("imgUrl", isManVal.getImgUrl());
	        sess.setAttribute("phone", isManVal.getPhone());
	        sess.setAttribute("password", isManVal.getPassword()); // Not recommended to store passwords in session!
	        sess.setAttribute("userType", "Manager");
	        
	        response.sendRedirect("dashboard.jsp"); 
		} else if (isDPsnVal!= null) {	
			sess.setAttribute("ID", isDPsnVal.getEmID());
	        sess.setAttribute("email", isDPsnVal.getEmail());
	        sess.setAttribute("nic", isDPsnVal.getNic());
	        sess.setAttribute("dob", isDPsnVal.getDob());
	        sess.setAttribute("imgUrl", isDPsnVal.getImgUrl());
	        sess.setAttribute("phone", isDPsnVal.getPhone());
	        sess.setAttribute("city", isDPsnVal.getCity());
	        sess.setAttribute("DrivingLicenseNum", isDPsnVal.getDrivingLicenseNum());
	        sess.setAttribute("vehicleNum", isDPsnVal.getVehicleNum());
	        sess.setAttribute("password", isDPsnVal.getPassword()); // Not recommended to store passwords in session!
	        sess.setAttribute("userType", "DeliveryPerson");
	        
	        response.sendRedirect("dashboard.jsp"); 
			} else {
				 sess.setAttribute("ID", isEmpVal.getEmID());
			     sess.setAttribute("email", isEmpVal.getEmail());
			     sess.setAttribute("nic", isEmpVal.getNic());
			     sess.setAttribute("dob", isEmpVal.getDob());
			     sess.setAttribute("imgUrl", isEmpVal.getImgUrl());
			     sess.setAttribute("phone", isEmpVal.getPhone());
			     sess.setAttribute("password", isEmpVal.getPassword()); // Not recommended to store passwords in session!
			     sess.setAttribute("userType", "Employee");

			        // Redirect to a success page or dashboard
			        response.sendRedirect("dashboard.jsp"); 
			}
		 } else if (isCusVal != null) {
			sess.setAttribute("ID", isCusVal.getCusID());
	        sess.setAttribute("email", isCusVal.getEmail());
	        sess.setAttribute("phone", isCusVal.getPhone());
	        sess.setAttribute("fName", isCusVal.getfName());
	        sess.setAttribute("lName", isCusVal.getlName());
	        sess.setAttribute("dob", isCusVal.getDob());
	        sess.setAttribute("imgUrl", isCusVal.getImgUrl());
	        sess.setAttribute("lane", isCusVal.getLane());
	        sess.setAttribute("city", isCusVal.getCity());
	        sess.setAttribute("password", isCusVal.getPassword()); // Not recommended to store passwords in session!
	        sess.setAttribute("userType", "Customer");
	        
	        response.sendRedirect("dashboard.jsp"); 

		} else if (isAdmVal != null) {
			sess.setAttribute("ID", isAdmVal.getAID());
	        sess.setAttribute("email", isAdmVal.getEmail());
	        sess.setAttribute("fName", isAdmVal.getfName());
	        sess.setAttribute("lName", isAdmVal.getlName());
	        sess.setAttribute("dob", isAdmVal.getDob());
	        sess.setAttribute("phone", isAdmVal.getPhone());
	        sess.setAttribute("imgUrl", isAdmVal.getImgUrl());
	        sess.setAttribute("lane", isAdmVal.getLane());
	        sess.setAttribute("city", isAdmVal.getCity());
	        sess.setAttribute("password", isAdmVal.getPassword()); // Not recommended to store passwords in session!
	        sess.setAttribute("userType", "Admin");
	        
	        response.sendRedirect("dashboard.jsp"); 

		} else {
            // Redirect to login page with an error message
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
		} catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("login.jsp?error=An error occurred");
	    }
	}

}
