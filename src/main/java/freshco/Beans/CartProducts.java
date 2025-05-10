package freshco.Beans;

public class CartProducts {
    private String productName; // Name of the product
    private String imgUrl;
    private int quantity; // Quantity of the product
    private double netPrice; // Original price of the product
    private double discount; // Discount percentage of the product
    private int pid; // Product ID

    public CartProducts(String productName, int quantity, double netPrice, double discount, String imgUrl, int pid) {
        this.productName = productName;
        this.quantity = quantity;
        this.netPrice = netPrice; // Set the original price
        this.discount = discount; // Set the discount percentage
        this.pid = pid;
        this.imgUrl = imgUrl;
    }

    public CartProducts(int pid, String productName, int quantity, double netPrice) {
        this.pid = pid;
    	this.productName = productName;
        this.quantity = quantity;
        this.netPrice = netPrice; // netPrice corresponds to the Product Price
        // Other attributes like discount and imgUrl are omitted since they are not used here
    }

    public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setnetPrice(double price) {
        this.netPrice = price; // Set original price
    }

    public double getDiscount() {
        return discount; // Return discount percentage
    }

    public void setDiscount(double discount) {
        this.discount = discount; // Set discount percentage
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public double getNetPrice() {
        // Calculate net price after discount
        return netPrice;
    }
}
