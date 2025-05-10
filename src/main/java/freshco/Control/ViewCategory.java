package freshco.Control;

import freshco.Beans.Category;
import freshco.Model.CategoryDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class ViewCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	List<Category> categories = CategoryDBUtil.getAllCategories();
            request.setAttribute("categories", categories);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CatDash.jsp");
            dispatcher.forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Retrieving employees failed.", e);
        }
    }
}
