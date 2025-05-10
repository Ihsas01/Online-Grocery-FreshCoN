package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Customer;



public class CustomerDBUtil {
//user validation
	public static Customer validateCustomer(String email, String password) throws Exception {
		
		String query = "SELECT * FROM customer WHERE email='"+email+"' AND password='"+password+"'";
		
		// Executes the query and stores the result
		ResultSet rs = webDB.executeSearch(query);
		
		 // If customer found in the result set
		if (rs.next()) {
			 // Create a new Customer object from the result set data
		Customer cus = new Customer(rs.getInt("CusID"),rs.getString("fName"),rs.getString("lName"),rs.getString("email"),rs.getString("phone"),rs.getString("lane"),rs.getString("city"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("password"));
		rs.close();
        return cus;
		} else {
			rs.close();
			return null;// Return null if validation fails
		}
	}
	
	public static List<Customer> getAllCustomer() throws Exception { // view customer
	    List<Customer> customers = new ArrayList<>(); // Initialize an empty list for customers
	    String Query = "SELECT * FROM Customer";
	    ResultSet rs = webDB.executeSearch(Query);
	    try {// Iterate through all result rows
	        while (rs.next()) {
	            // Fetch customer basic details
	            int cusID = rs.getInt("CusID");
	            String fName = rs.getString("fName");
	            String lName = rs.getString("lName");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String lane = rs.getString("lane");
	            String city = rs.getString("city");
	            String dob = rs.getString("dob");  // Assuming LocalDate for dob
	            String imgUrl = rs.getString("imgUrl");
	            String password = rs.getString("password");

	            // Create a new Customer object and add it to the list
	            Customer cus = new Customer(cusID, fName, lName, email, phone, lane, city, dob, imgUrl, password);
	            customers.add(cus);
	            
	        }
	    } catch (Exception e) {
	        throw e;// If any error occurs, throw the exception
	    }
	    rs.close();
	    return customers;
	}
// add customer
	public static boolean insertCustomer(String fName, String lName, String email,String phone, String lane, String city, String dob,String imgUrl, String password) {
    	
    	boolean isSuccess = false;
    	 // SQL query to insert a new customer into the database
    	String query = "INSERT INTO customer (fName, lName, email, phone, lane, city, dob,imgUrl, password) VALUES ('" + fName + "', '" + lName + "', '" + email + "', '" + phone + "', '" + lane + "', '" + city + "', '" + dob + "','"+imgUrl+"','"+password+"')";
    	
    		try {
    			 // Execute the insert operation and check if rows were affected
                int rowsAffected = webDB.executeIUD(query);

                isSuccess = rowsAffected > 0;

            } catch (Exception e) {
                e.printStackTrace();// Print if an error occurs 
            }

            return isSuccess;
    }
	
	// update customer
	public static boolean updateCustomer(int CusID,String fName, String lName, String email,String phone,String imgUrl, String lane, String city,String password) {
	
		boolean isSuccess = false;
		
		String query = "UPDATE customer SET fName='"+fName+"',lName='"+lName+"',email='"+email+"',phone='"+phone+"',imgUrl='"+imgUrl+"',lane='"+lane+"',city='"+city+"',password='"+password+"'"
				+ "where CusID='"+CusID+"'";

	try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
	
	
	
	//delete customer
public static boolean deleteCustomer(int CusID) {
	
	boolean isSuccess = false;
	
	String query = "DELETE FROM customer WHERE CusID='"+CusID+"'";

    	try {
            int rowsAffected = webDB.executeIUD(query);

            isSuccess = rowsAffected > 0;

    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }

public static boolean updateCustomerWithoutImage(int cusID, String fName, String lName, String email, String phone,
		String lane, String city, String password) {
	boolean isSuccess = false;
	
	String query = "UPDATE customer SET fName='"+fName+"',lName='"+lName+"',email='"+email+"',phone='"+phone+"',lane='"+lane+"',city='"+city+"',password='"+password+"'"
			+ "where CusID='"+cusID+"'";

try {
    int rowsAffected = webDB.executeIUD(query);

    isSuccess = rowsAffected > 0;

}
catch(Exception e) {
	e.printStackTrace();
}

return isSuccess;
}


}
