package freshco.Control;

import freshco.Model.CategoryDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int CID = Integer.parseInt(request.getParameter("CID"));

        boolean isSuccess = CategoryDBUtil.deleteCategory(CID);

        if (isSuccess) {
            response.sendRedirect("Category");  // Redirect to the view servlet
        } else {
            request.setAttribute("errorMessage", "Failed to delete category.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("Category");
			dispatcher1.forward(request, response);
        }
    }
}

