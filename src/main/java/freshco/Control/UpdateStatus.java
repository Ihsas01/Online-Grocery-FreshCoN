package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.SaleDBUtil;

public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int OID = Integer.parseInt(request.getParameter("sid"));
		int PID = Integer.parseInt(request.getParameter("pid"));
		boolean isSuccess = SaleDBUtil.UpdateStatus(PID, OID);

		if (isSuccess) {
            response.sendRedirect("Sale");
        } else {
        	request.setAttribute("errorMessage", "Failed. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("Sale");
			dispatcher1.forward(request, response);
        }
	}

}
