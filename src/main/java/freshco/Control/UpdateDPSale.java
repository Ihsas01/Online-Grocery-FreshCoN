package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.SaleDBUtil;

public class UpdateDPSale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");
        int OID = Integer.parseInt(request.getParameter("sid"));
		
        boolean isSuccess = SaleDBUtil.UpdateEmID(ID, OID);

        if (isSuccess) {
            response.sendRedirect("Sale");
        } else {
        	request.setAttribute("errorMessage", "Failed. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("Sale");
			dispatcher1.forward(request, response);
        }
    }
}