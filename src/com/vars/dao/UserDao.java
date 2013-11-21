package com.vars.dao;

import com.vars.domain.User;

public interface UserDao {
	
	void createUser(User user);
	
	User getUser(String userName);
	
	void updateUser(User user);

}
