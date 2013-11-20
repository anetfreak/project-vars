package com.vars.dao;

import com.vars.domain.Bid;
import com.vars.domain.User;

public interface UserDao {
	
	void createUser(User user);
	
	User getUser(User user);
	
	void updateUser(User user);

	void updateProposal(Bid bid);
}
