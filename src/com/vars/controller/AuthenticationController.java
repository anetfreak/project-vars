package com.vars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
		
		User user = userFacade.getUser(email);
		if(user!=null){
			if(user.getEmail().equals(email) && user.getPasswd().equals(password)){
				session.setAttribute("user", user);
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
	public ModelAndView signup(@RequestParam("firstName") String fname, 
			@RequestParam("lastName") String lname, 
			@RequestParam("email") String email,
			@RequestParam("password") String password, 
			@RequestParam("address") String address, 
			@RequestParam("pin") Integer pin,
			@RequestParam("mobile") Integer mobile,
			HttpSession session) {
		User user = new User();
		user.setEmail(email);
		user.setPasswd(password);
		user.setAddress(address);
		user.setAdmin(false);
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setPin(pin);
		user.setMobile(mobile);
		user.setLastLogin(user.getCurrentTime());
		System.out.println("Signup started for" + user.getFirstName() );
		
		userFacade.createUser(user);
		
		session.setAttribute("user", userFacade.getUser(user.getEmail()));
		session.setAttribute("sessionId", session.getId());
		System.out.println("Signup completed for user" + user.getFirstName() );
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
