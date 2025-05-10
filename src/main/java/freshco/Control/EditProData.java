package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Beans.Product;
import freshco.Model.ProductDBUtil;

public class EditProData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	int PrID = Integer.parseInt(request.getParameter("PrID"));
	    	Product product = null;
	    	
	    	try {
	            product = ProductDBUtil.getProductById(PrID); // Replace YourClass with the class containing your method
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle error (e.g., show error message on UI)
	        }

	        if (product != null) {
	            request.setAttribute("product", product);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("EditProduct.jsp");
	            dispatcher.forward(request, response);
	        } else {
	        	request.setAttribute("errorMessage", "Failed to Retrieve Data");
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("Product");
				dispatcher1.forward(request, response);
	        }
		}
}
