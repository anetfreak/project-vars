package com.vars.facade;

import com.vars.domain.User;

public class UserFacadeImpl implements UserFacade{

	@Override
	public void createUser(User user) {
		// TODO Auto-generated method stub
		// Accept and insert all params in database
		
	}

	@Override
	public User getUser(Integer id) {
		// TODO Auto-generated method stub
		
		User user = new User();
		user.setEmail("sumant@murke.com");
		user.setFirstName("Sumant");
		user.setLastName("Murke");
		user.setPassword("pass");
		return user;
	}

}
