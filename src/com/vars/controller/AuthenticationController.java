package com.vars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Developer;
import com.vars.domain.Tester;
import com.vars.domain.User;
import com.vars.facade.UserFacade;

@Controller
public class AuthenticationController {

	private UserFacade userFacade;

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
			developer.setFirstName(fname);
			developer.setLastName(lname);
			developer.setLinkedInUrl("test url");
		} else {
			user.setIsTester(true);
			tester.setFirstName(fname);
			tester.setLastName(lname);
			tester.setLinkedInUrl("test url");
		}
		user.setUserName(email);
		user.setPassword(password);
		user.setDeveloper(developer);
		user.setTester(tester);
		userFacade.createUser(user);
		
		session.setAttribute("user", userFacade.getUser(user.getUserName()));
		session.setAttribute("sessionId", session.getId());

		return new ModelAndView("home");
	}
	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		
		session.invalidate();
		return new ModelAndView("home");
	}

	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
