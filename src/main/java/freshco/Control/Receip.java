package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Beans.SaleDetails;
import freshco.Model.SaleDBUtil;

public class Receip extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the OID parameter from the request
	        String orderIDParam = request.getParameter("OID");

	        // Attempt to parse the order ID
	        int orderID = Integer.parseInt(orderIDParam);

	        // Fetch sale details based on order ID
	        SaleDetails saleDetails;
	        try {
	            saleDetails = SaleDBUtil.getSaleDetailsByOrderID(orderID);
	            if (saleDetails == null) {
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sale details not found for Order ID: " + orderID);
	                return;
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Log the error
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching sale details.");
	            return;
	        }

	        // Store the sale details in the request attribute for the JSP page
	        request.setAttribute("saleDetails", saleDetails);
	        
	        // Forward the request to the JSP page that will display the sale details
	        request.getRequestDispatcher("Sales.jsp").forward(request, response);
	    }
	}

