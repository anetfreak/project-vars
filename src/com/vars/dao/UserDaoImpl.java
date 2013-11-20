package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.User;

public class UserDaoImpl extends JdbcDaoSupport implements UserDao {

	private static final String GET_USER = "select username, password from user where id = ?";
	
	private static final String INSERT_USER = "INSERT into user (username, password) values (?, ?)";
	
	private static final String INSERT_DEVELOPER = "INSERT into developer (user_id, first_name, last_name) values (?, ?, ?)";
	
	private static final String INSERT_TESTER = "INSERT into tester (user_id, first_name, last_name) values (?, ?, ?)";
	
	public void createUser(User user) {
		// TODO Auto-generated method stub
		//Make DB call to insert user here
		
		getJdbcTemplate().update(INSERT_USER, new Object[]{user.getUserName(), user.getPassword()});
		int userId = getJdbcTemplate().queryForInt("select last_insert_id()");
		
		System.out.println("userID: "+userId);
		user.setId(userId);
		if(user.isTester()) {
			user.getTester().setUserId(userId);
			getJdbcTemplate().update(INSERT_TESTER, new Object[]{user.getId(), user.getTester().getFirstName(), user.getTester().getLastName()} );
		} else {
			user.getDeveloper().setUserId(userId);
			System.out.println("Developer: userID:"+user.getDeveloper().getUserId());
			getJdbcTemplate().update(INSERT_DEVELOPER, new Object[]{user.getId(), user.getDeveloper().getFirstName(), user.getDeveloper().getLastName()} );
		}
	}

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

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
}
