package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Bid;
import com.vars.domain.Project;

public class BidDaoImpl extends JdbcDaoSupport implements BidDao {
	
	private static final String INSERT_BID = "INSERT into bid (project_id, tester_id, description, amount) values (?, ?, ?, ?)";
	private static final String GET_BIDS_PROJ = "SELECT * from bid where project_id = ?";
	public void createBid(Bid bid) {
		Project project = new Project();
		int testerId = 1;
		int projectId = 1;
		project.setProject_id(projectId);
		project.setTester_id(testerId);
		getJdbcTemplate().update(INSERT_BID, new Object[] {project.getProject_id(), project.getTester_id(), bid.getDescription(), bid.getAmount()});
		//getJdbcTemplate().update(INSERT_BID, new Object[] {project.getProject_id(), project.getTester_id(), bid.getDescription(), bid.getAmount()});
		//getJdbcTemplate().update(INSERT_BID, new Object[]{projectId, testerId, bid.getDescription(), bid.getAmount()});
		//This is to fetch project related fields from db for mapping bid with project
		/*List<Project> projects = getJdbcTemplate().query(GET_PROJECT, new Object[]{}, new RowMapper<User>(){
		@Override
		public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
			Project project = new Project();
			project.setTitle(title);
			project.setDescription(description);
			project.setDomain(domain);
			project.setDeveloper_id(developer_id);
			return project;
		}
	});*/
	}

	@Override
	public Bid getBid(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bid> getBidsForProjectDev(Integer id) {
		// returns a list of all bids related to a particular project
		List<Bid> bids = getJdbcTemplate().query(GET_BIDS_PROJ,
				new Object[] { id }, new RowMapper<Bid>() {
					@Override
					public Bid mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Bid bid = new Bid();
						bid.setId(rs.getInt(1));
						bid.setProjectId(rs.getInt(2));
						bid.setTester(rs.getInt(3));
						bid.setDescription(rs.getString(4));
						bid.setAmount(rs.getFloat(5));
						return bid;
					}
				});
		return bids;
	}

	@Override
	public List<Bid> getBidsForTester(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}