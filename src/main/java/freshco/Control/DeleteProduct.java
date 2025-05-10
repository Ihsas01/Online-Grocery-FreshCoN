package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int PrID = Integer.parseInt(request.getParameter("PrID"));

        boolean isSuccess = ProductDBUtil.deleteProduct(PrID);

        if (isSuccess) {
            response.sendRedirect("Product");
        } else {
            request.setAttribute("errorMessage", "Failed to delete product");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("Product");
			dispatcher1.forward(request, response);
        }
    }
}

