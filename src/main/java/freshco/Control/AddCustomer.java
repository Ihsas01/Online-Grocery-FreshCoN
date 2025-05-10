package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.CustomerDBUtil;


@MultipartConfig
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

 // Handles the POST request . when form is submitted
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
	         	String fName = request.getParameter("fName");
	         	String lName = request.getParameter("lName");
	         	String email = request.getParameter("email");
	         	String phone = request.getParameter("phone");
	         	String lane = request.getParameter("lane");
	         	String city = request.getParameter("city");
	         	String dob = request.getParameter("dob");
	         	String password = request.getParameter("password");
	         	
	            //  forward  request to the UploadImg servlet
	         	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
	            dispatcher.include(request, response); //  ImageUploadServlet's response 

	            // Retrieve the image URL stored as an attribute by the UploadImage servlet
	            String imgUrl = (String) request.getAttribute("imageUrl"); 
	         	

	         // Call  CustomerDBUtil  insert the customer into the database
		        boolean isInserted = CustomerDBUtil.insertCustomer(fName,lName,email,phone,lane,city,dob,imgUrl,password);
		     //   successful
		        if (isInserted) {
		        	
		            response.sendRedirect("login.jsp");
		        } else {
		        	request.setAttribute("errorMessage", "Failed to add Customer. Email already exists. try login.");
					RequestDispatcher dispatcher1 = request.getRequestDispatcher("login.jsp");
					dispatcher1.forward(request, response);
		        }
		    }
	

}
