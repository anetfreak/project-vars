package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.User;

public class UserDaoImpl extends JdbcDaoSupport implements UserDao {

	private static final String GET_USER = "select username, password from user where id = ?"; 
	
	@Override
	public void createUser(User user) {
		// TODO Auto-generated method stub
		//Make DB call to insert user here
	}

	@Override
	public User getUser(Integer id) {
		//Fetch user from DB here and return
		//TODO - Set the actual fetched data in the User object. Add columns in DB corresponding to the ones in domain USer.
		
		return getJdbcTemplate().queryForObject(GET_USER, new Object[]{id}, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserName("username");
				user.setPassword("password");
				return user;
			}
		});
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
}
