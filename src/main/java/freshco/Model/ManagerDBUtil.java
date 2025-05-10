package freshco.Model;
import java.sql.ResultSet;
import freshco.Beans.Manager;

public class ManagerDBUtil {
	// Method to validate User based on email and password
		// Used in UserValidation Servlet
    public static Manager validateManager(String email, String password) throws Exception {
        // SQL query to validate manager credentials using JOIN
        String query = "SELECT e.*" +  
                       "FROM employee e " +
                       "JOIN manager m ON e.EmID = m.EmID " + 
                       "WHERE e.email='" + email + "' AND e.password='" + password + "'";
        
        // Execute the query and get the result set
        ResultSet rs = webDB.executeSearch(query);
        
        // Check if a result was returned
        if (rs.next()) {
            
            Manager manager = new Manager(
                rs.getInt("EmID"),                  
                rs.getString("email"),              
                rs.getString("nic"),                
                rs.getString("dob"),                
                rs.getString("imgUrl"),             
                rs.getString("phone"),              
                rs.getString("password")          	
            );
            
            rs.close(); 
            return manager; // Return the Manager
        } else {
            rs.close(); 
            return null; // Return null if no valid manager found
        }
    }
    
 // Method to Create Employee
 		// Used in AddEmpMan Servlet
	public static boolean insertManager(String email, String nic, String dob, String phone, String imgUrl, String password, int ID) {	    
	    boolean isSuccess = false;

	    
	    String queryEmployee = "INSERT INTO employee (email, nic, dob, phone, imgUrl, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + phone + "','" + imgUrl + "', '" + password + "')";

	    try {
	      
	        int rowsAffected = webDB.executeIUD(queryEmployee);

	        if (rowsAffected > 0) {
	        	
	            ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
	            if (rs.next()) {
	            	int lastEmID = rs.getInt(1);
	                
	                
	                String queryManager = "INSERT INTO manager (EmID) VALUES ('" + lastEmID + "')";
	                int rowsAffected2 = webDB.executeIUD(queryManager);
	                
	                isSuccess = rowsAffected2 > 0; 
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return isSuccess;
	}


    // Method to Update Manager
	// Used in UpdateManager Servlet
	public static boolean updateManager(int EmID, String email, String imgUrl, String phone, String password) {
	    
	    boolean isSuccess = false;
	    
	    // Fixed query with correct spacing
	    String query = "UPDATE employee SET email='" + email + "', imgUrl='"+imgUrl+"',  phone='" + phone + "', password='" + password + "' WHERE EmID='" + EmID + "'";
	    
	    try {
	        int rowsAffected = webDB.executeIUD(query);

	        isSuccess = rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return isSuccess;
	}

	
	// Method to Delete Manager
	// Used in DeleteManager Servlet
public static boolean deleteManager(int EmID) {
	
	boolean isSuccess = false;
	boolean isSuccess2 = false;
	
	String queryManager = "DELETE FROM manager WHERE EmID = '" + EmID + "'";
	String queryEmployee = "DELETE FROM employee WHERE EmID = '" + EmID + "'";


    	try {
            int rowsAffected = webDB.executeIUD(queryManager);
            int rowsAffected2 = webDB.executeIUD(queryEmployee);
            
            isSuccess = rowsAffected > 0;
            isSuccess2 = rowsAffected2 > 0;
            
            
        	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	if(isSuccess && isSuccess2) {
    		return true;
    	}else {
    			return false;
    	}
	}

//Method to Update Manager withoutImage
	// Used in UpdateManager Servlet
public static boolean updateManagerWithoutImage(int emID, String email, String phone, String password) {
	boolean isSuccess = false;
    
    // Fixed query with correct spacing
    String query = "UPDATE employee SET email='" + email + "',  phone='" + phone + "', password='" + password + "' WHERE EmID='" + emID + "'";
    
    try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return isSuccess;
}
}
