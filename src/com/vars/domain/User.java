package com.vars.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class User {
	
	private String firstName;
	private String lastName;
	private String email;
	private String passwd;
	private String address;
	private Integer pin;
	private Integer mobile;
	private String lastLogin;
	private boolean isAdmin;
	
	public User() {
		super();
	}
		
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public Integer getPin() {
		return pin;
	}


	public void setPin(Integer pin) {
		this.pin = pin;
	}


	public Integer getMobile() {
		return mobile;
	}


	public void setMobile(Integer mobile) {
		this.mobile = mobile;
	}


	public String getLastLogin() {
		return lastLogin;
	}

	public String getCurrentTime()
	{
		Calendar cal = Calendar.getInstance();
    	cal.getTime();
    	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
    	return sdf.format(cal.getTime()) ;
	}
	
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}


	public boolean isAdmin() {
		return isAdmin;
	}


	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}


	public User(String firstName, String lastName, String email, String passwd) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.passwd = passwd;
	}



	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}
