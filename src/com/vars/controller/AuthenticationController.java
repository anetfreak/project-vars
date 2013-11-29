package com.vars.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Developer;
import com.vars.domain.Response;
import com.vars.domain.Tester;
import com.vars.domain.User;
import com.vars.facade.UserFacade;

@Controller
public class AuthenticationController {

	private UserFacade userFacade;
	private static final String VIEW_NAME = "commonJsonView";

	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public ModelAndView showLogin() {
		return new ModelAndView("auth/user_login");
	}

	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setUserName(email);
		user.setPassword(password);
		
		User userDb = userFacade.getUser(user.getUserName());
		if(userDb!=null){
			if(userDb.getUserName().equals(user.getUserName()) && userDb.getPassword().equals(user.getPassword())){
				session.setAttribute("user", userDb);
				session.setAttribute("sessionId", session.getId());
			}
			modelAndView.setViewName("home");
		}
		else{
			modelAndView.setViewName("auth/user_login");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/inLogin.htm", method = RequestMethod.POST)
	public ModelAndView inLogin(@RequestParam("id") String linkedInId, HttpSession session) {
		User user = userFacade.getInUser(linkedInId);
		session.setAttribute("user", user);
		session.setAttribute("sessionId", session.getId());
		
		return new ModelAndView("viewProjects.htm");
	}

	@RequestMapping(value = "/signup.htm", method = RequestMethod.GET)
	public ModelAndView showSignup() {
		return new ModelAndView("auth/user_signup");
	}

	@RequestMapping(value = "/signup.htm", method = RequestMethod.POST)
	public ModelAndView signup(@RequestParam("fname") String fname, 
			@RequestParam("lname") String lname, 
			@RequestParam("email") String email,
			@RequestParam("password") String password, 
			@RequestParam("userType") Integer userType,
			HttpSession session) {
		
		User user = new User();
		Developer developer = new Developer();
		Tester tester = new Tester();

		if(userType == 0) {
			user.setIsTester(false);
			//developer.setFirstName(fname);
			//developer.setLastName(lname);
			//developer.setLinkedInUrl("test url");
		} else {
			user.setIsTester(true);
			//tester.setFirstName(fname);
			//tester.setLastName(lname);
			//tester.setLinkedInUrl("test url");
		}
		user.setUserName(email);
		user.setPassword(password);
		user.setDeveloper(developer);
		user.setTester(tester);
		user.setFirstName(fname);
		user.setLastName(lname);
		userFacade.createUser(user);
		
		session.setAttribute("user", userFacade.getUser(user.getUserName()));
		session.setAttribute("sessionId", session.getId());
		System.out.println("Signup completed for user" + user.getFirstName() );
		return new ModelAndView("home");
	}
	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		
		session.invalidate();
		return new ModelAndView("home");
	}
	
	@RequestMapping(value = "/checkINUser.htm", method = RequestMethod.POST)
	public ModelAndView checkInUser(@RequestParam("id") String linkedInId, HttpSession session) {
		ModelAndView modelAndView;
		Response response = null;
		boolean exists = userFacade.checkInUser(linkedInId);
		if(exists) {
			response = new Response("exists");
			User user = userFacade.getInUser(linkedInId);
			session.setAttribute("user", user);
			session.setAttribute("sessionId", session.getId());
			
			modelAndView = new ModelAndView("viewProjects.htm");
		} else {
			response = new Response("newUser");
			modelAndView = new ModelAndView("signup.htm");
		}
		
		return modelAndView;
	}

	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
