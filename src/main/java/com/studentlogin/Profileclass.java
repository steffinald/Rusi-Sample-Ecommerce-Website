package com.studentlogin;

public class Profileclass {

	private String name;
	private String email;
	private String address;
	private String mobile;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Profileclass( String mobile ,String name, String email, String address) {
		super();
		this.mobile = mobile;
		this.name = name;
		this.email = email;
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}
