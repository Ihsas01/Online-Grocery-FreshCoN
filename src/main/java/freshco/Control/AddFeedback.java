package freshco.Control;

import freshco.Model.FeedbackDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String comments = request.getParameter("comments");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int oid = Integer.parseInt(request.getParameter("oID"));
        
        // comment validation
        if (comments == null || comments.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Comments cannot be empty.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Feedback.jsp");
            dispatcher.forward(request, response);
            return; // forwarding after exit 
        }

       //insert feedback
        boolean isAdded = FeedbackDBUtil.insertFeedback(comments, rating, oid);

        // Redirect  result
        if (isAdded) {
            response.sendRedirect("Sale"); // feedback list page on success
        } else {
            request.setAttribute("errorMessage", "Something went wrong. Please try again.");
            RequestDispatcher dispatcher1 = request.getRequestDispatcher("Feedback.jsp");
            dispatcher1.forward(request, response);
        }
    }

}
