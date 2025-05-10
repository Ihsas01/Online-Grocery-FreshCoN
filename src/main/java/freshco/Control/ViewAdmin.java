package freshco.Control;
import freshco.Beans.Admin;
import freshco.Model.AdminDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ViewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public ViewAdmin() {
        super();
      
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Admin> admins = AdminDBUtil.getAllAdmins(); // Retrieve all admin records
            request.setAttribute("admins", admins); // Set the admin list 
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdmDash.jsp"); // Forward to AdminDash.jsp
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving admins failed.", e);
        }
    }


}
