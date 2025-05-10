package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Enquiry;


public class EnquiryDBUtil {

	public static List<Enquiry> getAllEnquiry() throws Exception {
        List<Enquiry> enquiry = new ArrayList<>();
        String query = "SELECT * FROM Enquiry";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
        	Enquiry enq = new Enquiry(rs.getInt("EnID"),rs.getString("email"),rs.getString("subject"),rs.getString("comments"),rs.getString("response"));
        	enquiry.add(enq);
        }
        rs.close();
        return enquiry;
    }
	
	
	
	
	public static boolean insertEnquiry(String email,String subject, String comments) {
    	
    	boolean isSuccess = false;
    	
    	String query = "INSERT INTO enquiry (email,subject, comments) VALUES ('" + email + "','" + subject + "', '" + comments + "')";
    	
    		try {
                int rowsAffected = webDB.executeIUD(query);

                isSuccess = rowsAffected > 0;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return isSuccess;
    }
    
	
	
	
	
	
	public static boolean updateEnquiry(int EnID, String response) {
	
		boolean isSuccess = false;
		
		String query = "UPDATE enquiry SET response='"+response+"'" + "where EnID='"+EnID+"'";

	try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
	
	
	
	
public static boolean deleteEnquiry(int EnID) {
	
	boolean isSuccess = false;
	
	String query = "DELETE FROM enquiry WHERE EnID='"+EnID+"'";

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
