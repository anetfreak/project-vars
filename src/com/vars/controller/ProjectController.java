package com.vars.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Project;
import com.vars.facade.ProjectFacade;

@Controller
public class ProjectController {

	private ProjectFacade projectFacade;
	private List<Project> projects = null;
	
	public void setProjectFacade(ProjectFacade projectFacade) {
		this.projectFacade = projectFacade;
	}

	@RequestMapping(value = "/project.htm", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("projectTitle") String projectTitle,
			@RequestParam("domain") String domain,
			@RequestParam("description") String description) {
		Project project = new Project();
		project.setTitle(projectTitle);
		project.setDescription(description);
		project.setDeveloper_id(1);
		project.setTester_id(1);
		project.setDomain(domain);
		projectFacade.createProject(project);
		return new ModelAndView("owner_home");
	}
	
	@RequestMapping(value = "/viewProjects.htm", method = RequestMethod.GET)
	public ModelAndView showProjectsForDev() {
		//getProjectDev needs developer Id to fetch 
		projects = projectFacade.getProjectDev(1);
		
		return new ModelAndView("owner_home", "projects", projects );
	}
	
	@RequestMapping(value = "/viewNewProjects.htm", method = RequestMethod.GET)
	public ModelAndView showNewProjectsForTest() {
		//getProjectDev needs tester Id to fetch 
		projects = projectFacade.getNewProjects();
		System.out.println("In showNewProjectsForTest");
		return new ModelAndView("tester_home", "projects", projects);
	}
	
	@RequestMapping(value = "/viewTesterProjects.htm", method = RequestMethod.GET)
	public ModelAndView getProjectTest() {
		//getProjectDev needs tester Id to fetch
		int id = 1;
		projects = projectFacade.getProjectTest(id);
		System.out.println("In viewTesterProjects");
		return new ModelAndView("tester_home", "projects", projects);
	}
	
	@RequestMapping(value = "/project/view_project{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProject(@PathVariable("id") String id) {
		Project project = projectFacade.getProject(Integer.parseInt(id));
		return new ModelAndView("view_project", "project", project);
	}
}
