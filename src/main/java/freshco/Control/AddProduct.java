package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@MultipartConfig
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST method 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 // Retrieving form parameters from the request object.
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        String pricePa = request.getParameter("price");
        double price = Double.parseDouble(pricePa); // Converting price from String to double.
        String unit = request.getParameter("unit");
        int quantity = Integer.parseInt(request.getParameter("quantity"));     
        double discount = Double.parseDouble(request.getParameter("discount")); 
        int CID = Integer.parseInt(request.getParameter("CID"));  
        
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); 

        
        
        String imgUrl = (String) request.getAttribute("imageUrl"); 
     	
        HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");

     // Inserting  new product into the database using ProductDBUtil
        boolean isSuccess = ProductDBUtil.insertProduct(productName, descript, price, unit, quantity, imgUrl, discount, CID, ID);

        if (isSuccess) {
        	
        	// If successful, redirect to the product page
            response.sendRedirect("Product");
        } else {
        	
        	// If failed, set an error message 
        	request.setAttribute("errorMessage", "Failed to add Product. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("ProductForm");
			dispatcher1.forward(request, response); // Forwarding request to ProductForm.jsp.
        }
    }
}
