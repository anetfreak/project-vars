package com.vars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.User;
import com.vars.facade.UserFacade;

@Controller
public class UserController {

	private UserFacade userFacade;
	
	@RequestMapping(value = "/showUser.htm", method = RequestMethod.GET)
	public ModelAndView showUser() {
		return new ModelAndView("create_user");
	}

	@RequestMapping(value = "/user.htm", method = RequestMethod.GET)
	public ModelAndView getUser(Integer id) {
		
		User user = userFacade.getUser(1);
		ModelAndView modelAndView = new ModelAndView("user_success");
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	
	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}

}
