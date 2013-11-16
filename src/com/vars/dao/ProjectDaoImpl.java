package com.vars.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import com.vars.domain.Project;

public class ProjectDaoImpl extends JdbcDaoSupport implements ProjectDao {

	private static final String GET_PROJECT = "select username, password from user where id = ?"; 
	
	@Override
	public void createProject(Project user) {
		// TODO Auto-generated method stub

	}

	@Override
	public Project getProject(Integer id) {
		return getJdbcTemplate().queryForObject(GET_PROJECT, new Object[]{id}, new RowMapper<Project>(){
			@Override
			public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
				Project project = new Project();
				project.setTitle(rs.getString("title"));
				project.setDeveloper_id(rs.getString("title"));
				project.setTester_id(rs.getString("title"));
				return project;
			}
		});
	}

}
