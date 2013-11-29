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
public class UserController {

	private UserFacade userFacade;
	
	@RequestMapping(value = "/showUser.htm", method = RequestMethod.GET)
	public ModelAndView showUser() {
		return new ModelAndView("create_user");
	}

	@RequestMapping(value = "/showProfile.htm", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		return new ModelAndView("/user_profile", "user", user);
	}
	

	
	@RequestMapping(value = "/showProfile.htm", method = RequestMethod.POST)
	public ModelAndView updateInfo(@RequestParam("fname") String fname, 
			@RequestParam("lname") String lname, 
			@RequestParam("email") String email,
			@RequestParam("password") String password){	
		User user = new User();
		Developer developer = new Developer();
		Tester tester = new Tester();
		
		user.setId(2);
		// get user object from session
		int userType = 0;
		
		if(userType == 0) {
			//developer.setFirstName(fname);
			//developer.setLastName(lname);
		} else {
			//tester.setFirstName(fname);
			//tester.setLastName(lname);
		}
		user.setUserName(email);
		user.setPassword(password);
		user.setDeveloper(developer);
		user.setTester(tester);
		user.setFirstName(fname);
		user.setLastName(lname);
		userFacade.updateUser(user);
		return new ModelAndView("hello");
	}

	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
