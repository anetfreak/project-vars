package com.vars.facade;

import java.util.ArrayList;

import com.vars.dao.UserDao;
import com.vars.domain.Order;
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
	public ArrayList<Order> getOrdersForUser(String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
