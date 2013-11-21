package com.vars.controller;

import java.util.ArrayList;
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
	
	public void setProjectFacade(ProjectFacade projectFacade) {
		this.projectFacade = projectFacade;
	}

	@RequestMapping(value = "/projectowner_home.htm", method = RequestMethod.POST)
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
		return new ModelAndView("projectowner_home");
	}
	
	@RequestMapping(value = "/viewProjects.htm", method = RequestMethod.GET)
	public ModelAndView showProjectsForDev() {
		//getProjectDev needs developer Id to fetch 
		List<Project> projects = projectFacade.getProjectDev(1);
		if(projects.size() > 0)
		return new ModelAndView("projectowner_home", "projects", projects );
		else
		return null;
	}
	
	//@RequestMapping(value = "/viewProjects.htm", method = RequestMethod.GET)
	//public ModelAndView showProjectsForTest() {
		//getProjectDev needs tester Id to fetch 
		//return new ModelAndView("projectowner_home", "projects", projectFacade.getProjectTest(1));
	//}
	
	@RequestMapping(value = "/project/{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProject(@PathVariable("id") String id) {
		Project project2 = new Project();
		project2.setTitle("Title 2");
		project2.setDescription("Description 2");
		project2.setDeveloper_id(2);
		project2.setTester_id(2);
		project2.setDomain("Domain 2");
		
		return new ModelAndView("projectowner_home", "project2", project2);
	}
}
