package freshco.Control;
import freshco.Beans.Employee;
import freshco.Model.EmployeeDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
    	List<Employee> employees = EmployeeDBUtil.getAllEmployees();
        request.setAttribute("employees", employees); // Set the employee list as an attribute in the request
        RequestDispatcher dispatcher = request.getRequestDispatcher("EmpDash.jsp");
        dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving employees failed.", e);
        }

    }

}
