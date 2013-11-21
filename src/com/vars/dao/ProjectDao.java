package com.vars.dao;

import java.util.List;

import com.vars.domain.Project;

public interface ProjectDao {
	void createProject(Project user);
	Project getProject(Integer id);
	List<Project> getProjectDev(Integer id);
	List<Project> getProjectTest(Integer id);
	List<Project> getNewProjects();
}
