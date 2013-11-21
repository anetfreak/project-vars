package com.vars.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Project;
import com.vars.domain.User;
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
			@RequestParam("description") String description,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Project project = new Project();
		project.setTitle(projectTitle);
		project.setDescription(description);
		project.setDeveloper_id(user.getDeveloper().getId());
		project.setDomain(domain);
		
		projectFacade.createProject(project);
		return new ModelAndView("owner_home");
	}
	
	@RequestMapping(value = "/viewProjects.htm", method = RequestMethod.GET)
	public ModelAndView showProjectsForDev(HttpSession session) {
		//getProjectDev needs developer Id to fetch 
		ModelAndView modelAndView;
		User user = (User) session.getAttribute("user"); 
		if(user != null) {
			if(user.getIsTester()) {
				projects = projectFacade.getNewProjects();
				if(projects.size() <= 0)
					modelAndView = new ModelAndView("tester_home", "projects", null);
				else
					modelAndView = new ModelAndView("tester_home", "projects", projects );
			} else {
				projects = projectFacade.getProjectDev(user.getDeveloper().getId());
				if(projects.size() <= 0)
					modelAndView = new ModelAndView("owner_home", "projects", null);
				else
					modelAndView = new ModelAndView("owner_home", "projects", projects );
			}
		} else {
			modelAndView = new ModelAndView("auth/user_login");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/viewTesterProjects.htm", method = RequestMethod.GET)
	public ModelAndView getProjectTest() {
		//getProjectDev needs tester Id to fetch
		int id = 1;
		projects = projectFacade.getProjectTest(id);
		System.out.println("In viewTesterProjects");
		return new ModelAndView("tester_home", "projects", projects);
	}
	
	@RequestMapping(value = "/project/tester_project/{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProject(@PathVariable("id") String id) {
		Project project = projectFacade.getProject(Integer.parseInt(id));
		return new ModelAndView("tester_project", "project", project);
	}
	
	@RequestMapping(value = "/project/view_project/{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProjectToDevp(@PathVariable("id") Integer id) {
		Project project = projectFacade.getProject(id);
		return new ModelAndView("view_project", "project", project);
	}
}
