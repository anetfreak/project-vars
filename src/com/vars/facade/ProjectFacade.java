package com.vars.facade;

import com.vars.domain.Project;

public interface ProjectFacade {

	void createProject(Project project);
	Project getProject(Integer id);
}
