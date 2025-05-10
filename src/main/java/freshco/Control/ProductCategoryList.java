package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Beans.Category;
import freshco.Model.CategoryDBUtil;

public class ProductCategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	        	List<Category> categories = CategoryDBUtil.getAllCategories();
	            request.setAttribute("categories", categories);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("AddProducts.jsp");
	            dispatcher.forward(request,response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new ServletException("Retrieving Category failed.", e);
	        }
	    }

}
