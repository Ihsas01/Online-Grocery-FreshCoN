package freshco.Control;
import freshco.Beans.Enquiry;
import freshco.Model.EnquiryDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ViewEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public ViewEnquiry() {
        super();
      
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
    	List<Enquiry> enquiry = EnquiryDBUtil.getAllEnquiry();
        request.setAttribute("enquiry", enquiry); // Set the enquiry list as an attribute in the request
        RequestDispatcher dispatcher = request.getRequestDispatcher("EnqDash.jsp");
        dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving Enquiry failed.", e);
        }

    }

}
