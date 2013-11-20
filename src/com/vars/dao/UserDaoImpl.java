package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Bid;
import com.vars.domain.User;

public class UserDaoImpl extends JdbcDaoSupport implements UserDao {

	private static final String GET_USER = "select * from user where username = ? && password = ?";
	
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

	public User getUser(User user) {
		//Fetch user from DB here and return
		//TODO - Set the actual fetched data in the User object. Add columns in DB corresponding to the ones in domain USer.
		
		List<User> users = getJdbcTemplate().query(GET_USER, new Object[]{user.getUserName(), user.getPassword()}, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserName(rs.getString(2));
				user.setPassword(rs.getString(3));
				return user;
			}
		});
		
		User userDb =  DataAccessUtils.singleResult(users);
		/*User userDb1 = getJdbcTemplate().queryForObject(GET_USER, new Object[]{user.getUserName(), user.getPassword()}, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserName(rs.getString(2));
				user.setPassword(rs.getString(3));
				return user;
			}
		});*/
		return userDb;
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
	public void updateProposal(Bid bid) {
	
	}
}