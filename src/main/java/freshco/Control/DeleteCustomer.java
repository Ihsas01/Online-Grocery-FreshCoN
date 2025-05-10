package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.CustomerDBUtil;



public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCustomer() {
        super();
    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get  customer ID from the request
	        int CusID = Integer.parseInt(request.getParameter("CusID"));

	        // Call  deleteCustomer database 
	        boolean isDeleted = CustomerDBUtil.deleteCustomer(CusID);

	        if (isDeleted) {
	            //  success delete
	            response.sendRedirect("logout");
	        } else {
	        	request.setAttribute("errorMessage", "Failed to Delete Customer. Please try again.");
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");// Forwards the request to EditProfile.jsp
				dispatcher1.forward(request, response);
	        }
	    }
	}
