package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.ManagerDBUtil;

@MultipartConfig
public class UpdateManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	    	int EmID = (int) session.getAttribute("ID");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");


     	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
        
        boolean isSuccess;
        if (imgUrl != null) {
            isSuccess = ManagerDBUtil.updateManager(EmID, email, imgUrl, phone, password);
        } else {
            isSuccess = ManagerDBUtil.updateManagerWithoutImage(EmID, email, phone, password);
        }
        
        if (isSuccess) {
        	request.setAttribute("email", email);
            request.setAttribute("password", password);
            
        	RequestDispatcher userValidationDispatcher = request.getRequestDispatcher("login");
            userValidationDispatcher.forward(request, response);
        } else {
        	request.setAttribute("errorMessage", "Failed to update Employee. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
			dispatcher1.forward(request, response);
        }
    }
}
