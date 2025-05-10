package freshco.Control;

import freshco.Model.AdminDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// form parameters
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		String address = request.getParameter("Lane");
		String city = request.getParameter("city");
		String dob = request.getParameter("dob");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");

		// Include ImageUploadServlet's 
		RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
		dispatcher.include(request, response); 

		String imgUrl = (String) request.getAttribute("imageUrl");

		// Method call admin
		boolean isAdded = AdminDBUtil.addAdmin(fName, lName, email, address, city, dob, imgUrl, phone, password);

		// Redirect based on the result
		if (isAdded) {
			response.sendRedirect("Admin");
		} else {
			request.setAttribute("errorMessage", "Failed to add Admin. Email already exists. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("AdminRegistration.jsp");
			dispatcher1.forward(request, response);
		}
	}
}
