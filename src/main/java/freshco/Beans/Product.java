package freshco.Beans;

public class Product {
    
    private int prID; // Changed from PrID to prID
    private String productName;
    private String descript;
    private double price;
    private String unit;
    private int quantity;
    private String imgUrl;
    private double discount;
    private int CID;

    
    //using  Constructor to product Object
    public Product(int prID, String productName, String descript, double price, String unit, int quantity, String imgUrl,
                   double discount, int cID) {
        super();
        this.prID = prID; 
        this.productName = productName;
        this.descript = descript;
        this.price = price;
        this.unit = unit;
        this.quantity = quantity;
        this.imgUrl = imgUrl;
        this.discount = discount;
        this.CID = cID; 
    }

    
    // Constructor with only productID and productName
    public Product(int prID, String productName) {
        this.prID = prID;
        this.productName = productName;
    }

    // Getter methods
    public int getPrID() {
        return prID; // No change needed here
    }

    public String getProductName() {
        return productName;
    }

    public String getDescript() {
        return descript;
    }

    public double getPrice() {
        return price;
    }

    public String getUnit() {
        return unit;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public double getDiscount() {
        return discount;
    }

    public int getCID() {
        return CID; // If this is meant to be capitalized, keep it as is
    }

    // Setter methods
    public void setPrID(int prID) {
        this.prID = prID; // Update to match the renamed field
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public void setCID(int cID) {
        this.CID = cID; // No change needed here
    }
}
