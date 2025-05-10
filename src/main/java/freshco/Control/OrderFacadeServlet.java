package freshco.Control;

import freshco.Model.PaymentDBUtil;
import freshco.Model.ProductDBUtil;
import freshco.Model.SaleDBUtil;
import freshco.Beans.CartProducts;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class OrderFacadeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<CartProducts> cartProducts = (List<CartProducts>) session.getAttribute("cartItems");
        String paymentMethod = request.getParameter("payment");

        String deliveryAddress; // Initialize deliveryAddress variable
        
        // Determine the delivery address based on user selection
        String addressType = request.getParameter("address");
        if ("existing".equals(addressType)) {
            // Get the existing address from session
            String lane = (String) session.getAttribute("lane");
            String city = (String) session.getAttribute("city");
            deliveryAddress = lane + ", " + city; // Concatenate lane and city for the address
        } else { // New address
            String newAddress = request.getParameter("deliveryAddress");
            deliveryAddress = newAddress; // Use the new address from the form
        }

        // Retrieve total amount from the request
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount")); // Retrieve the total amount

        try {
           
            int paymentId = PaymentDBUtil.createPayment(paymentMethod);
            int saleId = SaleDBUtil.createSale(deliveryAddress, paymentId, (int) session.getAttribute("ID"), totalAmount);
            ProductDBUtil.createProductSale(saleId, cartProducts);

            cartProducts.clear();
            session.setAttribute("cartProducts", cartProducts);
            response.sendRedirect("FreshCo"); // Redirect to a success page

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
