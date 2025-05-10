package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.ManagerDBUtil;

public class DeleteManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int EmID = Integer.parseInt(request.getParameter("EmID"));

        boolean isSuccess = ManagerDBUtil.deleteManager(EmID);

        if (isSuccess) {
            response.sendRedirect("logout");
        } else {
        	request.setAttribute("errorMessage", "Failed to Delete Employee. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
			dispatcher1.forward(request, response);
        }
    }
}
