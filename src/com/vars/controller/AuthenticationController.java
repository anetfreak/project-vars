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
		User user = new User();
		//User userDb = new User();
		user.setUserName(email);
		user.setPassword(password);
		
		User userDb = userFacade.getUser(user);
		if(userDb!=null){
			System.out.println("user username:" +user.getUserName());
			if(userDb.getUserName().equals(user.getUserName())){
				System.out.println("Login success");
			} 
		}
		else{
			System.out.println("Login Failed");
			System.out.println("In AuthenticationController:No record of user found in db");
		}
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
			developer.setLinkedInUrl("test url");
		} else {
			user.setTester(true);
			tester.setFirstName(fname);
			tester.setLastName(lname);
			tester.setLinkedInUrl("test url");
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