package com.vars.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Order;
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
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<Order> orders = null;
		modelAndView.setViewName("/user_profile");
		User user = (User) session.getAttribute("user");
		
		if(!user.isAdmin())
		{
			orders = userFacade.getOrdersForUser(user.getEmail());
			modelAndView.addObject("orders", orders);
		}
		modelAndView.addObject("user", user);
		return modelAndView;
	}
		
	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
