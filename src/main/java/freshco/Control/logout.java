package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        // Get the current session
	        HttpSession sess = request.getSession(false); // Get the current session, do not create if it doesn't exist
	        if (sess != null) {
	            // Invalidate the session, clearing all attributes
	            sess.invalidate();
	        }

	      
	        response.sendRedirect("login.jsp"); // Change this to your login page
	    }

}
