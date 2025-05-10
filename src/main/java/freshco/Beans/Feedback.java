package freshco.Beans;

public class Feedback {
	
	private int FID ;
    private String comments ;
    private int rating;
    private int OID ;
    
    //constructors
    
	public Feedback(int fID, String comments, int rating, int oID) {
		super();
		FID = fID;
		this.comments = comments;
		this.rating = rating;
		OID = oID;
	}


	public int getFID() {
		return FID;
	}


	public String getComments() {
		return comments;
	}


	public int getRating() {
		return rating;
	}


	public int getOID() {
		return OID;
	}


	public void setFID(int fID) {
		FID = fID;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public void setOID(int oID) {
		OID = oID;
	}
    

}
