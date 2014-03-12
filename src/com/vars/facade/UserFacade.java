package com.vars.facade;

import java.util.ArrayList;

import com.vars.domain.Order;
import com.vars.domain.User;

public interface UserFacade {
	
	void createUser(User user);
	
	User getUser(String userName);
	
	ArrayList<Order> getOrdersForUser(String email);	
}
