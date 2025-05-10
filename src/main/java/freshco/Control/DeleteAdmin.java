package freshco.Control;

import freshco.Model.AdminDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        //Admin ID from the request
        int AID = Integer.parseInt(request.getParameter("AID")); 

        // Method call delete admin
        boolean isDeleted = AdminDBUtil.deleteAdmin(AID);

        // Forwarding based on the result
        if (isDeleted) {
            response.sendRedirect("logout"); // Page redirect  success notifications
        } else {
        	request.setAttribute("errorMessage", "Failed to Delete Admin. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
			dispatcher1.forward(request, response);
        }
    }
}
