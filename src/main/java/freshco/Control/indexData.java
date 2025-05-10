package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Beans.Category;
import freshco.Beans.Feedback;
import freshco.Beans.Product;
import freshco.Model.CategoryDBUtil;
import freshco.Model.FeedbackDBUtil;
import freshco.Model.ProductDBUtil;

public class indexData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Category> categories = CategoryDBUtil.getAllCategories();
            request.setAttribute("categories", categories);
            List<Product> products = ProductDBUtil.getAllProducts();
            request.setAttribute("products", products);
            List<Feedback> feedbacks = FeedbackDBUtil.getAllFeedbacks(); // Retrieve all feedback records
            request.setAttribute("feedbacks", feedbacks); 
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request,response);
		} catch (Exception e) {
            e.printStackTrace();
        }
	}
}
