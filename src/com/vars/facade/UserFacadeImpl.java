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
	public User getUser(String userName) {
		return userDao.getUser(userName);
	}
	
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
		
	}
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean checkInUser(String linkedInId) {
		return userDao.checkInUser(linkedInId);
	}
	
}
