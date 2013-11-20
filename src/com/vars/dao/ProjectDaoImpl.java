package com.vars.dao;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Project;

public class ProjectDaoImpl extends JdbcDaoSupport implements ProjectDao {

	private static final String GET_PROJECT = "select title, devp_id, tester_id from project where id = ?"; 
	private static final String INSERT_PROJECT = "INSERT into project (title, desc, domain, devp_id, tester_id) values (?, ?, ?, ?, ?)";
	
	@Override
	public void createProject(Project project) {
		// TODO Auto-generated method stub
		getJdbcTemplate().update(INSERT_PROJECT, new Object[]{project.getTitle(), project.getDescription()
				,project.getDomain(), project.getDeveloper_id(), project.getTester_id() } );
	}

	@Override
	public Project getProject(Integer id) {
		return getJdbcTemplate().queryForObject(GET_PROJECT, new Object[]{id}, new RowMapper<Project>(){
			@Override
			public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
				Project project = new Project();
				project.setTitle(rs.getString("title"));
				project.setDeveloper_id(rs.getInt("devp_id"));
				project.setTester_id(rs.getInt("tester_id"));
				return project;
			}
		});
	}

}
