package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.CartProducts;

public class RemoveCartProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("pid"));
	        HttpSession session = request.getSession();
	        @SuppressWarnings("unchecked")
			List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

	        if (cartItems != null) {
	            cartItems.removeIf(item -> item.getPid() == productId);
	        }

	        
	        response.sendRedirect("ViewCart"); 
	    }
	}
