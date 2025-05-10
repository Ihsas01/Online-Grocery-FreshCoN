package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EnquiryDBUtil;



public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
		 			String email = request.getParameter("email");
     	            String subject = request.getParameter("subject");
                   	String comments = request.getParameter("comments");
		
		
	      
		        
		        boolean isInserted = EnquiryDBUtil.insertEnquiry(email,subject,comments);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("FreshCo");
		        } else {
		        	request.setAttribute("errorMessage", "Something Went Wrong. Please try again.");
					RequestDispatcher dispatcher1 = request.getRequestDispatcher("FreshCo");
					dispatcher1.forward(request, response);
		       }
		    }
	

}
