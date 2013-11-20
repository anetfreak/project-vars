package com.vars.controller;

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
			@RequestParam("password") String password) {
		System.out.println("Email Received: " + email);
		System.out.println("Password Received: " + password);
		return new ModelAndView("hello");
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
			@RequestParam("userType") Integer userType) {
		User user = new User();
		Developer developer = new Developer();
		Tester tester = new Tester();
		
		if(userType == 0) {
			user.setTester(false);
			developer.setFirstName(fname);
			developer.setLastName(lname);
		} else {
			user.setTester(true);
			tester.setFirstName(fname);
			tester.setLastName(lname);
		}
		user.setUserName(email);
		user.setPassword(password);
		user.setDeveloper(developer);
		user.setTester(tester);
		
		userFacade.createUser(user);
		
		return new ModelAndView("hello");
	}

	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}