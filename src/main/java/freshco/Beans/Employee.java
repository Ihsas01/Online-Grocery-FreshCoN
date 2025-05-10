package freshco.Beans;

public class Employee {
	private int EmID;
	private String email;
	private String nic;
	private String dob;
	private String imgUrl;
	private String phone;
	private String password;
	
	public Employee(int emID, String email, String nic, String dob, String imgUrl, String phone, String password) {
		EmID = emID;
		this.email = email;
		this.nic = nic;
		this.dob = dob;
		this.imgUrl = imgUrl;
		this.phone = phone;
		this.password = password;
	}

	public int getEmID() {
		return EmID;
	}

	public void setEmID(int emID) {
		EmID = emID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
