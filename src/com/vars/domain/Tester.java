package com.vars.domain;

import java.util.ArrayList;

public class Tester {
	private Integer id;
	private Integer userId;
	private String firstName;
	private String lastName;
	private String linkedInUrl;
	private ArrayList<TestingRating> ratings;
	private Float averageRating;
	
	public ArrayList<TestingRating> getRatings() {
		return ratings;
	}
	public void setRatings(ArrayList<TestingRating> ratings) {
		this.ratings = ratings;
	}
	public String getLinkedInUrl() {
		return linkedInUrl;
	}
	public void setLinkedInUrl(String linkedInUrl) {
		this.linkedInUrl = linkedInUrl;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public Float getAverageRating() {
		Float avg = 0.0f;
		Integer numberOfRatings = this.ratings.size();
		Float sumOfRatings = 0.0f;
		if(numberOfRatings > 0) {
			for(TestingRating rating : this.ratings) {
				sumOfRatings = sumOfRatings + rating.getRating();
			}
			avg = sumOfRatings/numberOfRatings; 
		}
		
		return avg;
	}
	public void setAverageRating(Float averageRating) {
		this.averageRating = averageRating;
	}
	

}
