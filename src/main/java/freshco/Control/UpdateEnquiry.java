package freshco.Control;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EnquiryDBUtil;

public class UpdateEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        int EnID = Integer.parseInt(request.getParameter("enID"));
	         	String respons = request.getParameter("response");
	         

		        // Call the updateEnquirymethod from your database class
		        boolean isUpdated = EnquiryDBUtil.updateEnquiry(EnID, respons);

		        if (isUpdated) {
		            // Redirect or inform the user of success
		            response.sendRedirect("Enquiry");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }

}
