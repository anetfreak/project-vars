package com.vars.facade;

import com.vars.domain.User;

public interface UserFacade {
	
	void createUser(User user);
	
	User getUser(String userName);
	
	void updateUser(User user);

}
