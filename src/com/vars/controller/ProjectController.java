package com.vars.controller;

import java.util.ArrayList;
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
import com.vars.facade.BidFacade;
import com.vars.facade.ProjectFacade;

@Controller
public class ProjectController {

	private ProjectFacade projectFacade;
	private BidFacade bidFacade;
	public void setBidFacade(BidFacade bidFacade) {
		this.bidFacade = bidFacade;
	}

	public void setProjectFacade(ProjectFacade projectFacade) {
		this.projectFacade = projectFacade;
	}

	@RequestMapping(value = "/project.htm", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("projectTitle") String projectTitle,
			@RequestParam("domain") String domain,
			@RequestParam("description") String description,
			@RequestParam("projectURL") String projectURL,
			@RequestParam("minBudget") int minBudget,
			@RequestParam("maxBudget") int maxBudget,
			@RequestParam("projectSkills") String projectSkills,
			@RequestParam("projectUsers") String projectUsers,
						HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Project project = new Project();
		project.setTitle(projectTitle);
		project.setDescription(description);
		project.setDeveloper_id(user.getDeveloper().getId());
		project.setDomain(domain);
		project.setProject_url(projectURL);
		project.setMin_budget(minBudget);
		project.setMax_budget(maxBudget);
		project.setProject_skills(projectSkills);
		project.setProject_users(projectUsers);
		
		projectFacade.createProject(project);
		return new ModelAndView("owner_home");
	}
	
	@RequestMapping(value = "/viewProjects.htm", method = RequestMethod.GET)
	public ModelAndView showProjectsForDev(HttpSession session) {
		//getProjectDev needs developer Id to fetch 
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("user"); 
		if(user != null) {
			if(user.getIsTester()) {
				ArrayList<Project> newProjects = projectFacade.getNewProjects();
				System.out.println("New Projects count"+ newProjects.size());
				
				ArrayList<Project> myProjects = bidFacade.getProjectsForTester(user.getTester().getId());
				System.out.println("My Projects count"+ myProjects.size());
				
				modelAndView.setViewName("tester_home");
				
				if(newProjects.size() <= 0) {
					modelAndView.addObject("newProjects", null);
				} else {
					modelAndView.addObject("newProjects", newProjects);
				}
				
				if(myProjects.size() <= 0)
				{
					modelAndView.addObject("myProjects", null);
				}
				else
				{
					modelAndView.addObject("myProjects", myProjects);
				}
				
			} else {
				List<Project> projects = projectFacade.getProjectDev(user.getDeveloper().getId());
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
		List<Project> projects = projectFacade.getProjectTest(id);;
		return new ModelAndView("tester_home", "projects", projects);
	}
	
	@RequestMapping(value = "/project/tester_project/{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProject(@PathVariable("id") String id) {
		Project project = projectFacade.getProject(Integer.parseInt(id));
		return new ModelAndView("tester_project", "project", project);
	}
	
	@RequestMapping(value = "/project/devp_project/{id}.htm", method = RequestMethod.GET)
	public ModelAndView showProjectToDevp(@PathVariable("id") Integer id) {
		Project project = projectFacade.getProject(id);
		project.setProject_id(id);
		return new ModelAndView("devp_project", "project", project);
	}
}
