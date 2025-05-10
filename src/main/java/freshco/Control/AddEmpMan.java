package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.EmployeeDBUtil;
import freshco.Model.ManagerDBUtil;

@MultipartConfig
public class AddEmpMan extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
		String eType = request.getParameter("eType");
		HttpSession session = request.getSession();
		int ID = (int) session.getAttribute("ID");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
     	
        
		boolean isSuccess = false;
		
		if(eType == null || eType.isEmpty()){
			isSuccess = EmployeeDBUtil.insertEmployee(email, nic, dob, phone, imgUrl, password, ID);

		}else if("manager".equals(eType)) {
			
			isSuccess = ManagerDBUtil.insertManager(email, nic, dob, phone, imgUrl, password, ID);

		}
		
		 if (isSuccess) {
	            response.sendRedirect("Employee");
	        } else {
	        	request.setAttribute("errorMessage", "Failed to add Employee . Email already exists. Please try again.");
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("EmployeeManRegistration.jsp");
				dispatcher1.forward(request, response);
	        }
	}

}
