package com.vars.domain;

public class Project {
	private Integer project_id;
	private String title;
	private String description;
	private Integer developer_id;
	private Integer tester_id;
	private String domain;
	
	public Integer getProject_id() {
		return project_id;
	}
	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getDeveloper_id() {
		return developer_id;
	}
	public void setDeveloper_id(Integer developer_id) {
		this.developer_id = developer_id;
	}
	public Integer getTester_id() {
		return tester_id;
	}
	public void setTester_id(Integer tester_id) {
		this.tester_id = tester_id;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	}
