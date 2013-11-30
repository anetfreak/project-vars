package com.vars.domain;

import java.util.Date;

public class TestingRating {
private Integer testerId;
private Integer developerId;
private Float rating;
private Integer id;
private Date date;
private String developerName;

public Integer getTesterId() {
	return testerId;
}
public String getDeveloperName() {
	return developerName;
}
public void setDeveloperName(String developerName) {
	this.developerName = developerName;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public void setTesterId(Integer testerId) {
	this.testerId = testerId;
}
public Integer getDeveloperId() {
	return developerId;
}
public void setDeveloperId(Integer developerId) {
	this.developerId = developerId;
}
public Float getRating() {
	return rating;
}
public void setRating(Float rating) {
	this.rating = rating;
}

}
