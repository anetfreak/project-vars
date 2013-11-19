package com.vars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthenticationController {

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
	public void signup(@RequestParam("fname") String fname,@RequestParam("lname") String lname,@RequestParam("email") String email,
			@RequestParam("password") String password,@RequestParam("userType") String userType) {
		System.out.println("First name Received: " + fname);
		System.out.println("Last Name Received: " + lname);
		System.out.println("Email Received: " + email);
		System.out.println("Password Received: " + password);
		System.out.println("User type Received: " + userType);
//		return new ModelAndView("hello");
	}
}