package com.vars.controller;

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
}
