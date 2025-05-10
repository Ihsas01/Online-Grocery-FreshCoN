package freshco.Model;

import java.sql.ResultSet;
import freshco.Beans.DeliveryPerson;

public class DeliveryPersonDBUtil {
	// Method to validate User based on email and password
			// Used in UserValidation Servlet
	    public static DeliveryPerson validateDeliveryPerson(String email, String password) throws Exception {
	        // SQL query to validate delivery person credentials using JOIN
	        String query = "SELECT e.*, dp.vehicleNum, dp.drivingLicenseNum, dp.city " +
	                       "FROM employee e " +
	                       "JOIN deliveryPerson dp ON e.EmID = dp.EmID " +
	                       "WHERE e.email='" + email + "' AND e.password='" + password + "'";
	        
	        // Execute the query and get the result set
	        ResultSet rs = webDB.executeSearch(query);
	        
	        // Check if a result was returned
	        if (rs.next()) {
	            // Create a DeliveryPerson object with the retrieved data
	            DeliveryPerson deliveryPerson = new DeliveryPerson(
	                rs.getInt("EmID"),                  
	                rs.getString("email"),              
	                rs.getString("nic"),                
	                rs.getString("dob"),                
	                rs.getString("imgUrl"),             
	                rs.getString("phone"),              
	                rs.getString("password"),           
	                rs.getString("vehicleNum"),         
	                rs.getString("drivingLicenseNum"),  
	                rs.getString("city")                
	            );
	            
	            rs.close(); 
	            return deliveryPerson; // Return object
	        } else {
	            rs.close(); 
	            return null; // Return null if no valid delivery person found
	        }
	    }
	    
	 // Method to CreateDP
	 // Used in AddDeliveryPerson Servlet
    public static boolean insertDeliveryPerson(String email, String nic, String dob, String imgUrl, String phone, String password, String vehicleNum, String drivingLicenseNum, String city, int ID) {
        boolean isSuccess = false;
        
        String queryEmployee = "INSERT INTO employee (email, nic, dob, imgUrl, phone, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + imgUrl +"', '" + phone + "', '" + password + "')";
        
        try {
            int rowsAffected = webDB.executeIUD(queryEmployee);

            if (rowsAffected > 0) {
                ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
                if (rs.next()) {
                    int lastEmID = rs.getInt(1);
                    
                    String queryDeliveryPerson = "INSERT INTO DeliveryPerson (EmID, vehicleNum, drivingLicenseNum, city) VALUES ('" + lastEmID + "', '" + vehicleNum + "', '" + drivingLicenseNum + "', '" + city + "')";
                    int rowsAffected2 = webDB.executeIUD(queryDeliveryPerson);
                    
                    isSuccess = rowsAffected2 > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    // Method to UpdateDP
 	 // Used in UpdateDeliveryPerson Servlet
    public static boolean updateDP(int EmID, String vehicleNum, String city, String email, String imgUrl, String phone, String password) {
        boolean isSuccess = false;

        String queryDeliveryPerson = "UPDATE deliveryperson SET vehicleNum='" + vehicleNum + "', city='" + city + "' WHERE EmID='" + EmID + "'";

        try {
            int rowsAffected = webDB.executeIUD(queryDeliveryPerson);
            
            String queryEmployee = "UPDATE employee SET email='" + email + "', imgUrl='" + imgUrl + "', phone='" + phone + "', password='" + password + "' WHERE EmID='" + EmID + "'";

            int rowsAffected2 = webDB.executeIUD(queryEmployee);

            isSuccess = (rowsAffected > 0 && rowsAffected2 > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    // Method to DeleteDP
	 // Used in DeleteDeliveryPerson Servlet
    public static boolean deleteDeliveryPerson(int EmID) {
        boolean isSuccess = false;

        String queryDeliveryPerson = "DELETE FROM DeliveryPerson WHERE EmID = '" + EmID + "'";
        String queryEmployee = "DELETE FROM employee WHERE EmID = '" + EmID + "'";

        try {
            int rowsAffected = webDB.executeIUD(queryDeliveryPerson);
            int rowsAffected2 = webDB.executeIUD(queryEmployee);
            
            isSuccess = (rowsAffected > 0 && rowsAffected2 > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    // Method to UpdateDP withoutImage
	 // Used in UpdateDeliveryPerson Servlet
	public static boolean updateDPWithoutImage(int emID, String vehicleNum, String city, String email, String phone,
			String password) {
		boolean isSuccess = false;

        String queryDeliveryPerson = "UPDATE deliveryperson SET vehicleNum='" + vehicleNum + "', city='" + city + "' WHERE EmID='" + emID + "'";

        try {
            int rowsAffected = webDB.executeIUD(queryDeliveryPerson);
            
            String queryEmployee = "UPDATE employee SET email='" + email + "', phone='" + phone + "', password='" + password + "' WHERE EmID='" + emID + "'";

            int rowsAffected2 = webDB.executeIUD(queryEmployee);

            isSuccess = (rowsAffected > 0 && rowsAffected2 > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
	}
}
