package com.vars.domain;

public class User {
	
	private Integer id;
	private String password;
	private String userName;
	private Developer developer;
	private Tester tester;
	private boolean isTester;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Developer getDeveloper() {
		return developer;
	}
	public void setDeveloper(Developer developer) {
		this.developer = developer;
	}
	public Tester getTester() {
		return tester;
	}
	public void setTester(Tester tester) {
		this.tester = tester;
	}
	public boolean isTester() {
		return isTester;
	}
	public void setTester(boolean isTester) {
		this.isTester = isTester;
	}
	
}
