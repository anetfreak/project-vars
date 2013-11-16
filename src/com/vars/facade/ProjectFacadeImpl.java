package com.vars.facade;

import com.vars.dao.ProjectDao;
import com.vars.domain.Project;

public class ProjectFacadeImpl implements ProjectFacade {

	private ProjectDao _projectDao;
	
	@Override
	public void createProject(Project project) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Project getProject(Integer id) {
		// TODO Auto-generated method stub
		return _projectDao.getProject(id);
	}
	
	public void setProjectDao(ProjectDao projectDao) {
		this._projectDao = projectDao;
	}

}
