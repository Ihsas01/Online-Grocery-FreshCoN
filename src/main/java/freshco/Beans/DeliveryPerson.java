package freshco.Beans;

public class DeliveryPerson extends Employee {
	private String vehicleNum;
	private String drivingLicenseNum;
	private String city;
	
	public DeliveryPerson(int emID, String email, String nic, String dob, String imgUrl, String phone, String password, String vehicleNum, String drivingLicenseNum, String city) {
		super(emID, email, nic, dob, imgUrl, phone, password);
		this.vehicleNum = vehicleNum;
		this.drivingLicenseNum = drivingLicenseNum;
		this.city = city;
	}
	public String getVehicleNum() {
		return vehicleNum;
	}

	public void setVehicleNum(String vehicleNum) {
		this.vehicleNum = vehicleNum;
	}

	public String getDrivingLicenseNum() {
		return drivingLicenseNum;
	}

	public void setDrivingLicenseNum(String drivingLicenseNum) {
		this.drivingLicenseNum = drivingLicenseNum;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
	
	
}
