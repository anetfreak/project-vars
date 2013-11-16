package com.vars.dao;

import com.vars.domain.Project;

public interface ProjectDao {
	void createProject(Project user);

	Project getProject(Integer id);
}
