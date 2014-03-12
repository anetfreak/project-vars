package com.vars.dao;

import java.util.ArrayList;

import com.vars.domain.Order;
import com.vars.domain.User;

public interface UserDao {
	
	void createUser(User user);
	
	User getUser(String userName);

	ArrayList<Order> getOrdersForUser(String email);
	
}
