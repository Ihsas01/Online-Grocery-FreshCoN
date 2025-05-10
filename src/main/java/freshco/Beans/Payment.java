package freshco.Beans;



public class Payment {

	private int PID;
    private String payMethod;
    private boolean payStatus;
    
    
	public Payment(int pID, String payMethod, boolean payStatus) 
	
	{
		super();
		PID = pID;
		this.payMethod = payMethod;
		this.payStatus = payStatus;
	}


	public int getPID() {
		return PID;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public boolean isPayStatus() {
		return payStatus;
	}


	public void setPID(int pID) {
		PID = pID;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public void setPayStatus(boolean payStatus) {
		this.payStatus = payStatus;
	}
    
    
  
    
	
}
