package freshco.Beans;

public class Customer {
	
	    private int cusID;
	    private String fName;
	    private String lName;
	    private String email;
	    private String phone;
	    private String lane;
	    private String city;
	    private String dob; 
	    private String imgUrl;
	    private String password;
	    
	    
		public Customer(int cusID, String fName, String lName, String email, String phone, String lane, String city, String dob, String imgUrl, String password) 
		{
			super();
			this.cusID = cusID;
			this.fName = fName;
			this.lName = lName;
			this.email = email;
			this.phone = phone;
			this.lane = lane;
			this.city = city;
			this.dob = dob;
			this.imgUrl = imgUrl;
			this.password = password;
			
		}

		public Customer(int cusID, String fName, String lName, String email) {
		    super();
		    this.cusID = cusID;
		    this.fName = fName;
		    this.lName = lName;
		    this.email = email;
		}

		public Customer(int cusID, String fName, String lName, String email, String phone) {
		    this.cusID = cusID;
		    this.fName = fName;
		    this.lName = lName;
		    this.email = email;
		    this.phone = phone;
		    
		}


		public int getCusID() {
			return cusID;
		}


		public String getfName() {
			return fName;
		}


		public String getlName() {
			return lName;
		}


		public String getEmail() {
			return email;
		}


		public String getLane() {
			return lane;
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

		public String getPassword() {
			return password;
		}


		public void setCusID(int cusID) {
			this.cusID = cusID;
		}


		public void setfName(String fName) {
			this.fName = fName;
		}


		public void setlName(String lName) {
			this.lName = lName;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public void setLane(String lane) {
			this.lane = lane;
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


		public void setPassword(String password) {
			this.password = password;
		}
	    
	    
		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}

}
