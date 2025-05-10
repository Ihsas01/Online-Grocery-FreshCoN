package freshco.Beans;

public class Admin {
	
	private int AID ;
    private String  fName ;
    private String lName;
    private String email ;
    private String Lane ;
    private String city ;
    private String dob ;
    private String imgUrl ;
    private String phone ;
    private String password ;
    
    //constructors
    
	public Admin(int aID, String fName, String lName, String email, String address, String city, String dob, String imgUrl,
			String phone, String password) {
		super();
		AID = aID;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.Lane = address;
		this.city = city;
		this.dob = dob;
		this.imgUrl = imgUrl;
		this.phone = phone;
		this.password = password;
	}


	public String getlName() {
		return lName;
	}


	public void setlName(String lName) {
		this.lName = lName;
	}


	public int getAID() {
		return AID;
	}


	public String getfName() {
		return fName;
	}


	public String getEmail() {
		return email;
	}


	public String getLane() {
		return Lane;
	}


	public String getCity() {
		return city;
	}


	public String getDob() {
		return dob;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public String getPhone() {
		return phone;
	}

	public String getPassword() {
		return password;
	}


	public void setAID(int aID) {
		AID = aID;
	}


	public void setfName(String fName) {
		this.fName = fName;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setLane(String Lane) {
		this.Lane = Lane;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    

}
