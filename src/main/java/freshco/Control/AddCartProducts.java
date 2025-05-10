package freshco.Control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.CartProducts;

public class AddCartProducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int productId = Integer.parseInt(request.getParameter("pid")); 
        String productName = request.getParameter("productName"); 
        String netPriceStr = request.getParameter("netPrice"); 
        String quantityStr = request.getParameter("quantity"); 
        String discountStr = request.getParameter("discount"); 
        String imgUrl = request.getParameter("imgUrl"); 

        
        double netPrice = 0.0;
        int quantity = 1;
        double discount = 0.0;

        // Handling NULL values
        try {
            if (netPriceStr != null && !netPriceStr.isEmpty()) {
                netPrice = Double.parseDouble(netPriceStr);
            }
            if (quantityStr != null && !quantityStr.isEmpty()) {
                quantity = Integer.parseInt(quantityStr);
            }
            if (discountStr != null && !discountStr.isEmpty()) {
                discount = Double.parseDouble(discountStr);
            }
        } catch (NumberFormatException e) {
            
            response.sendRedirect("");
            return; 
        }

        //getting the created CartItem in Session
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
		List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

        
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }

        // if product exists
        boolean productExists = false;
        for (CartProducts item : cartItems) {
            if (item.getPid() == productId) {
                
                item.setQuantity(item.getQuantity() + quantity);
                productExists = true;
                break; 
            }
        }

        
        if (!productExists) {
            CartProducts newProduct = new CartProducts(productName, quantity, netPrice, discount, imgUrl, productId);
            cartItems.add(newProduct);
        }

        
        response.sendRedirect("Shop"); // redirect to shop after adding
    }
}
