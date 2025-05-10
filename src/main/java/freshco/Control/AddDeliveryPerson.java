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
public class AddDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String vehicleNum = request.getParameter("vehicleNum");
        String drivingLicenseNum = request.getParameter("drivingLicenseNum");
        String city = request.getParameter("city");
        HttpSession session = request.getSession();
        int ID = (int) session.getAttribute("ID");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
     	

        boolean isSuccess = DeliveryPersonDBUtil.insertDeliveryPerson(email, nic, dob, imgUrl, phone, password, vehicleNum, drivingLicenseNum, city, ID);

        if (isSuccess) {
            response.sendRedirect("Employee");
        } else {
        	request.setAttribute("errorMessage", "Failed to add Delivery Employee. Email already exists. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EmployeeDPRegistration.jsp");
			dispatcher1.forward(request, response);
        }
    }
}
