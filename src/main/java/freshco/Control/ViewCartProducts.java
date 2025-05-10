package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.CartProducts;

public class ViewCartProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        @SuppressWarnings("unchecked")
			List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

	        
	        request.setAttribute("cartItems", cartItems);
	        
	        
	        request.getRequestDispatcher("cart.jsp").forward(request, response);
	    }
	}

