package com.vars.facade;

import java.util.ArrayList;
import java.util.List;

import com.vars.dao.ProjectDao;
import com.vars.domain.Project;

public class ProjectFacadeImpl implements ProjectFacade {

	private ProjectDao projectDao;
	
	@Override
	public void createProject(Project project) {
		projectDao.createProject(project);
	}

	@Override
	public Project getProject(Integer id) {
		return projectDao.getProject(id);
	}
	
	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}
	
	@Override
	public List<Project> getProjectDev(Integer id) {
		return projectDao.getProjectDev(id);	
	}
	
	@Override
	public List<Project> getProjectTest(Integer id){
		return projectDao.getProjectTest(id);
	}
	
	@Override
	public ArrayList<Project> getNewProjects(){
		return projectDao.getNewProjects();
	}
}
