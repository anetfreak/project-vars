package com.vars.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Bid;
import com.vars.domain.Project;

public class BidDaoImpl extends JdbcDaoSupport implements BidDao {
	
	private static final String INSERT_BID = "INSERT into bid (project_id, tester_id, description, amount) values (?, ?, ?, ?)";

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bid> getBidsForTester(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}