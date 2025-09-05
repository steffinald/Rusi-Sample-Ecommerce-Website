package com.studentlogin;

public class User {
	public String getMobileNumber() {
		return mobilenumber;
	}

	public void setMobileNumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public User(String mobilenumber) {
		super();
		this.mobilenumber = mobilenumber;
		
	}

	

	private String mobilenumber;
	
	
}
