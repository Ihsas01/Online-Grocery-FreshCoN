package freshco.Control;
import freshco.Beans.Customer;
import freshco.Model.CustomerDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public ViewCustomer() {
        super();
      
    }

    //  GET request to view the cus
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	 // get  all customers from the db
    	List<Customer> customers = CustomerDBUtil.getAllCustomer();
        request.setAttribute("customers", customers); // Set the customer list as an attribute in the request
        //forward the request to CustDash.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustDash.jsp");
        dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            //throw error msg
            throw new ServletException("Retrieving customers failed.", e);
        }

    }

}
