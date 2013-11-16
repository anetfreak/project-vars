package com.vars.domain;

public class Project {
	private String project_id;
	private String title;
	private String developer_id;
	private String tester_id;
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDeveloper_id() {
		return developer_id;
	}
	public void setDeveloper_id(String developer_id) {
		this.developer_id = developer_id;
	}
	public String getTester_id() {
		return tester_id;
	}	
	public void setTester_id(String tester_id) {
		this.tester_id = tester_id;
	}
}
