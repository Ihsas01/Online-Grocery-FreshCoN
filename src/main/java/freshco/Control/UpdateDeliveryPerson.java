package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.DeliveryPersonDBUtil;

@MultipartConfig
public class UpdateDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	int EmID = (int) session.getAttribute("ID");
      	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 

    	String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String vehicleNum = request.getParameter("vehicleNum");
        String city = request.getParameter("city");
        

        boolean isSuccess;
        if (imgUrl != null) {
            isSuccess = DeliveryPersonDBUtil.updateDP(EmID, vehicleNum, city, email, imgUrl, phone, password);
        } else {
            isSuccess = DeliveryPersonDBUtil.updateDPWithoutImage(EmID, vehicleNum, city, email, phone, password);
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
