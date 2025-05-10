package freshco.Model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.CartProducts;
import freshco.Beans.Product;

public class ProductDBUtil {
    
    // Get all products
    public static List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";  // Query to get all products

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Product product = new Product(rs.getInt("PrID"),rs.getString("productName"),rs.getString("descript"),rs.getDouble("price"),rs.getString("unit"),rs.getInt("quantity"),rs.getString("imgUrl"),rs.getDouble("discount"),rs.getInt("CID"));
            products.add(product);
        }
        rs.close();
        return products;
    }

    // Insert a new product
    public static boolean insertProduct(String productName, String descript, double price, String unit, int quantity, String imgUrl, double discount, int CID, int employeeId) {
        boolean isSuccess = false;

        // SQL query to insert into the Product table
        String queryProduct = "INSERT INTO Product (productName, descript, price, unit, quantity, imgUrl, discount, CID) " +
                "VALUES ('" + productName + "', '" + descript + "', " + price + ", '" + unit + "', " + quantity + ", '" + imgUrl + "', " + discount + ", " + CID + ")";

        try {
            
            int rowsAffected = webDB.executeIUD(queryProduct);

            if (rowsAffected > 0) {
                
                ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
                if (rs.next()) {
                    int lastProductID = rs.getInt(1); 

                    // SQL query to insert into the Product_Employee table
                    String queryProductEmployee = "INSERT INTO Product_Employee (PrID, EmID) VALUES (" + lastProductID + ", " + employeeId + ")";

                   
                    int rowsAffected2 = webDB.executeIUD(queryProductEmployee);
                    
                    
                    isSuccess = rowsAffected2 > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        return isSuccess; 
    }
    

    // Update an existing product
    public static boolean updateProduct(int PrID, String productName, String descript, double price, int quantity, String imgUrl, double discount) {
        boolean isSuccess = false;
        String query = "UPDATE Product SET productName='" + productName + "', descript='" + descript + "', price=" + price +
                       ", quantity=" + quantity + ", imgUrl='" + imgUrl + "', discount=" + discount +
                       " WHERE PrID=" + PrID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Delete a product by ID
    public static boolean deleteProduct(int PrID) {
        boolean isSuccess = false;
        String query = "DELETE FROM Product WHERE PrID = " + PrID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if deletion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static Product getProductById(int prId) throws Exception {
        Product product = null; // Initialize product as null
        String query = "SELECT * FROM Product WHERE PrID = ?"; 

        try (PreparedStatement pstmt = webDB.getConnection().prepareStatement(query)) {
            pstmt.setInt(1, prId); 

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) { 
                    product = new Product(
                        rs.getInt("PrID"),
                        rs.getString("productName"),
                        rs.getString("descript"),
                        rs.getDouble("price"),
                        rs.getString("unit"),
                        rs.getInt("quantity"),
                        rs.getString("imgUrl"),
                        rs.getDouble("discount"),
                        rs.getInt("CID")
                    );
                }
            }
        } catch (SQLException e) {
            
            throw new Exception("Error retrieving product from database", e);
        }
        
        return product; 
    }

    public static void createProductSale(int saleId, List<CartProducts> cartItems) throws Exception {
        for (CartProducts product : cartItems) {
            if (product == null) {
                throw new Exception("One of the cart products is null");
            } else {
                
                String sql = "INSERT INTO Product_Sale (OID, PrID, quantity, netPrice) VALUES (" 
                            + saleId + ", " 
                            + product.getPid() + ", " 
                            + product.getQuantity() + ", "
                            + product.getQuantity() * product.getNetPrice() + ")";
                
                System.out.println("Executing SQL: " + sql);
                
                // Execute the SQL query
                webDB.executeIUD(sql);
                
                updateProductQuantity(product.getPid(), product.getQuantity());
            }
        }
    }


    private static void updateProductQuantity(int string, int quantity) throws Exception {
        String sql = "UPDATE Product SET quantity = quantity - " + quantity + " WHERE PrID = " + string;
        webDB.executeIUD(sql);
    }
    
}

