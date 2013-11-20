package com.vars.facade;

import com.vars.dao.UserDao;
import com.vars.domain.User;

public class UserFacadeImpl implements UserFacade{

	private UserDao userDao;
	
	@Override
	public void createUser(User user) {
		// TODO Auto-generated method stub
		// Accept and insert all params in database
		userDao.createUser(user);
	}

	@Override
	public User getUser(User user) {
		
		try {
			return userDao.getUser(user);
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new User();
		}
	}
	
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
