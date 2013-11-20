package com.vars.facade;

import java.util.List;

import com.vars.domain.Project;

public interface ProjectFacade {
	void createProject(Project project);
	Project getProject(Integer id);
	List<Project> getProjectDev(Integer id);
	List<Project> getProjectTest(Integer id);
}
