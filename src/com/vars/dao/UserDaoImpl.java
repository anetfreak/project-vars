package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Order;
import com.vars.domain.User;

public class UserDaoImpl extends JdbcDaoSupport implements UserDao {
	
	private static final String GET_USER = "select first_name, last_name, email, password, address, pin, mobile, lastLogin, isAdmin from user where email = ?";
	private static final String INSERT_USER = "INSERT into user (first_name, last_name, email, password, address, pin, mobile, lastLogin, isAdmin) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ORDERS_FOR_USER = "select id, email, catalogid, productid, price, quantity   from tester_rating where email = ?";
		
	//Done
	// first_name, last_name, email, password, address, pin, mobile, lastLogin, isAdmin
	public void createUser(User user) {
		// TODO Auto-generated method stub
		//Make DB call to insert user here
		getJdbcTemplate().update(INSERT_USER, new Object[]{ user.getFirstName(), 
				user.getLastName(), user.getEmail(), user.getPasswd(), 
				user.getPasswd(), user.getPin(), user.getMobile(), user.getLastLogin(), user.isAdmin() ? 1 : 0});
		}
		
	//Done
	public User getUser(final String username) {
		System.out.println("username fo get user is " + username);
		User user = getJdbcTemplate().queryForObject(GET_USER, new Object[]{username}, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setEmail(username);
				user.setPasswd(rs.getString("password"));
				user.setAdmin(rs.getInt("istester") == 1 ? true : false);
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setAddress(rs.getString("address"));
				user.setPin(rs.getInt("pin"));
				user.setMobile(rs.getInt("mobile"));
				user.setLastLogin(rs.getString("lastLogin"));
				return user;
			}
		});
		return user;
	}
	
	// Done
	@Override
	public ArrayList<Order> getOrdersForUser(String email) {
		List<Order> orders = getJdbcTemplate().query(GET_ORDERS_FOR_USER,
				new Object[] { email }, new RowMapper<Order>() {
					@Override
					public Order mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Order order = new Order();
						order.setOrderId(rs.getInt("id"));
						order.setEmail(rs.getString("email"));
						order.setCatalogId(rs.getInt("catalogid"));
						order.setProductId(rs.getInt("productid"));
						order.setPrice(rs.getInt("price"));
						order.setQuantity(rs.getInt("quantity"));
						return order;
					}
				});

		return (ArrayList<Order>) orders;
	}
}