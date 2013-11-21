package com.vars.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.vars.domain.Project;

public class ProjectDaoImpl extends JdbcDaoSupport implements ProjectDao {

	private static final String GET_PROJECT = "select title, description, domain, devp_id, tester_id from project where id = ?";
	private static final String INSERT_PROJECT = "INSERT into project (title, description, domain, devp_id) values (?, ?, ?, ?)";
	private static final String GET_PROJECTS_DEV = "select * from project where devp_id = ?";
	private static final String GET_PROJECTS_TESTER = "select * from project where tester_id IS NULL";
	
	@Override
	public void createProject(Project project) {
		// TODO Auto-generated method stub
		getJdbcTemplate().update( INSERT_PROJECT, new Object[] { project.getTitle(), project.getDescription(), project.getDomain(), project.getDeveloper_id() });
	}

	@Override
	public Project getProject(Integer id) {
		return getJdbcTemplate().queryForObject(GET_PROJECT,
				new Object[] { id }, new RowMapper<Project>() {
					@Override
					public Project mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Project project = new Project();
						project.setTitle(rs.getString("title"));
						project.setDeveloper_id(rs.getInt("devp_id"));
						project.setTester_id(rs.getInt("tester_id"));
						project.setDomain(rs.getString("domain"));
						project.setDescription(rs.getString("description"));
						return project;
					}
				});
	}

	@Override
	public List<Project> getProjectDev(Integer id) {
		List<Project> projects = getJdbcTemplate().query(GET_PROJECTS_DEV,
				new Object[] { id }, new RowMapper<Project>() {
					@Override
					public Project mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Project project = new Project();
						project.setProject_id(rs.getInt(1));
						project.setTitle(rs.getString(2));
						project.setDescription(rs.getString(3));
						project.setDomain(rs.getString(4));
						project.setDeveloper_id(rs.getInt(5));
						project.setTester_id(rs.getInt(6));
						return project;
					}
				});

		return projects;
	}

	@Override
	public List<Project> getProjectTest(Integer id) {
		List<Project> projects = getJdbcTemplate().query(GET_PROJECTS_TESTER,
				new Object[] { id }, new RowMapper<Project>() {
					@Override
					public Project mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Project project = new Project();
						project.setProject_id(rs.getInt(1));
						project.setTitle(rs.getString(2));
						project.setDescription(rs.getString(3));
						project.setDomain(rs.getString(4));
						project.setDeveloper_id(rs.getInt(5));
						project.setTester_id(rs.getInt(6));
						return project;
					}
				});

		return projects;
	}
	
	@Override
	public List<Project> getNewProjects() {
		
		List<Project> projects = getJdbcTemplate().query(GET_PROJECTS_TESTER,
				new Object[] { }, new RowMapper<Project>() {
					@Override
					public Project mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Project project = new Project();
						project.setProject_id(rs.getInt(1));
						project.setTitle(rs.getString(2));
						project.setDescription(rs.getString(3));
						project.setDomain(rs.getString(4));
						project.setDeveloper_id(rs.getInt(5));
						project.setTester_id(rs.getInt(6));
						return project;
					}
				});

		return projects;
	}
}
