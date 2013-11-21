package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Bid;
import com.vars.domain.Project;
import com.vars.domain.User;

public class BidDaoImpl extends JdbcDaoSupport implements BidDao {

	@Override
	public void createBid(Bid user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Bid getBid(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bid> getBidsForProjectDev(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bid> getBidsForTester(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}