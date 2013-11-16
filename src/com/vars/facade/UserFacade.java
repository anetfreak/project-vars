package com.vars.facade;

import com.vars.domain.User;

public interface UserFacade {
	
	void createUser(User user);
	
	User getUser(Integer id);
	
	void updateUser(User user);

}
