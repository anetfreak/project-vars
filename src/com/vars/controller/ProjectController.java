package com.vars.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Project;
import com.vars.facade.ProjectFacade;

@Controller
public class ProjectController {

	private ProjectFacade projectFacade;
	
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
	public ModelAndView showProjects() {
		ArrayList<Project> projects = new ArrayList<Project>();
		
		Project project = new Project();
		project.setTitle("Title 1");
		project.setDescription("Description 1");
		project.setDeveloper_id(1);
		project.setTester_id(1);
		project.setDomain("Domain 1");
		projects.add(project);
		
		Project project2 = new Project();
		project2.setTitle("Title 2");
		project2.setDescription("Description 2");
		project2.setDeveloper_id(2);
		project2.setTester_id(2);
		project2.setDomain("Domain 2");
		projects.add(project2);
		
		return new ModelAndView("projectowner_home", "projects", projects);
	}
}
