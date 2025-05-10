package freshco.Beans;

import java.util.List;

public class SaleDetails {
    private Sale sale;
    private Payment payment;
    private Feedback feedback;
    private Customer customer;
    private List<CartProducts> cartProducts;
    
    public SaleDetails(Sale sale, Payment payment, Feedback feedback, Customer customer) {
        this.sale = sale;
        this.payment = payment;
        this.feedback = feedback;
        this.customer = customer;
    }
    
    public SaleDetails(Sale sale, Customer customer, List<CartProducts> cartProducts2) {
        this.sale = sale;
        this.customer = customer;
        this.cartProducts = cartProducts2;
    }

    
    public List<CartProducts> getCartProducts() {
		return cartProducts;
	}

	public Sale getSale() {
        return sale;
    }

    public Payment getPayment() {
        return payment;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public Customer getCustomer() {
        return customer;
    }
}
