package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Developer;
import com.vars.domain.Tester;
import com.vars.domain.User;

public class UserDaoImpl extends JdbcDaoSupport implements UserDao {

	private static final String GET_USER = "select id, password, istester from user where username = ?";
	
	private static final String GET_DEVELOPER = "select id, first_name, last_name, linkedin_url from developer where user_id = ?";
	
	private static final String GET_TESTER = "select id, first_name, last_name, linkedin_url from tester where user_id = ?";
	
	private static final String GET_PROJECT = "select * from project where id = ?";
	
	private static final String INSERT_USER = "INSERT into user (username, password, istester ) values (?, ?, ?)";
	
	private static final String INSERT_DEVELOPER = "INSERT into developer (user_id, first_name, last_name) values (?, ?, ?)";
	
	private static final String INSERT_TESTER = "INSERT into tester (user_id, first_name, last_name) values (?, ?, ?)";
	
	private static final String INSERT_BID = "INSERT into bid (project_id, tester_id, description, amount) values (?, ?, ?, ?)";

private static final String UPDATE_USER = "UPDATE user set username =? , password =? where id = ?";
	
	private static final String UPDATE_DEVELOPER = "UPDATE developer set first_name =?, last_name=? where user_id = ?";
	
	private static final String UPDATE_TESTER = "UPDATE tester set first_name =?, last_name =? where user_id =?";

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		getJdbcTemplate().update(UPDATE_USER, new Object[]{user.getUserName(), user.getPassword(), user.getId()});
		int userId = getJdbcTemplate().queryForInt("select last_insert_id()");
		
		System.out.println("userID: "+userId);
		user.setId(userId);
		if(user.getIsTester()) {
			user.getTester().setUserId(userId);
			getJdbcTemplate().update(UPDATE_TESTER, new Object[]{user.getTester().getFirstName(), user.getTester().getLastName(), user.getId()} );
		} else {
			user.getDeveloper().setUserId(userId);
			System.out.println("Developer: userID:"+user.getDeveloper().getUserId());
			getJdbcTemplate().update(UPDATE_DEVELOPER, new Object[]{user.getDeveloper().getFirstName(), user.getDeveloper().getLastName(), user.getId()} );
		}
	}
	
	public void createUser(User user) {
		// TODO Auto-generated method stub
		//Make DB call to insert user here
		getJdbcTemplate().update(INSERT_USER, new Object[]{user.getUserName(), user.getPassword(), user.getIsTester() ? 1 : 0});
		int userId = getJdbcTemplate().queryForInt("select last_insert_id()");
		
		System.out.println("userID: "+userId);
		user.setId(userId);
		if(user.getIsTester()) {
			user.getTester().setUserId(userId);
			getJdbcTemplate().update(INSERT_TESTER, new Object[]{user.getId(), user.getTester().getFirstName(), user.getTester().getLastName()} );
		} else {
			user.getDeveloper().setUserId(userId);
			getJdbcTemplate().update(INSERT_DEVELOPER, new Object[]{user.getId(), user.getDeveloper().getFirstName(), user.getDeveloper().getLastName()} );
		}
	}

	public User getUser(final String username) {
		
		User user = getJdbcTemplate().queryForObject(GET_USER, new Object[]{username}, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUserName(username);
				user.setPassword(rs.getString("password"));
				user.setIsTester(rs.getInt("istester") == 1 ? true : false);
				return user;
			}
		});
		
		if(user.getIsTester()) {
			Tester tester = getJdbcTemplate().queryForObject(GET_TESTER, new Object[]{user.getId()}, new RowMapper<Tester>(){
				@Override
				public Tester mapRow(ResultSet rs, int rowNum) throws SQLException {
					Tester tester = new Tester();
					tester.setId(rs.getInt("id"));
					tester.setFirstName(rs.getString("first_name"));;
					tester.setLastName(rs.getString("last_name"));
					tester.setLinkedInUrl(rs.getString("linkedin_url"));
					return tester;
				}
			}); 
			user.setTester(tester);
		} else {
			Developer developer = getJdbcTemplate().queryForObject(GET_DEVELOPER, new Object[]{user.getId()}, new RowMapper<Developer>(){
				@Override
				public Developer mapRow(ResultSet rs, int rowNum) throws SQLException {
					Developer developer = new Developer();
					developer.setId(rs.getInt("id"));
					developer.setFirstName(rs.getString("first_name"));;
					developer.setLastName(rs.getString("last_name"));
					developer.setLinkedInUrl(rs.getString("linkedin_url"));
					return developer;
				}
			});
			user.setDeveloper(developer);
		}
		return user;
	}

}
