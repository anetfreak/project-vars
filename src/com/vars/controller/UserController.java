package com.vars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Bid;
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

	@RequestMapping(value = "/showUser.htm", method = RequestMethod.GET)
	public ModelAndView createUser() {
		return new ModelAndView();
	}
	
	/*@RequestMapping(value = "/user.htm", method = RequestMethod.GET)
	public ModelAndView getUser(Integer id) {
		User user = userFacade.getUser(1);
		ModelAndView modelAndView = new ModelAndView("user_success");
		modelAndView.addObject("user", user);
		return modelAndView;
	}*/
	@RequestMapping(value = "/tester_proposal.htm", method = RequestMethod.POST)
	public ModelAndView tester_proposal(@RequestParam("projectTitle") String projectTitle, @RequestParam("proposal") String proposal, 
			@RequestParam("proposalDescription") String proposalDescription) {
		
		System.out.println("Project Title: "+projectTitle);
		System.out.println("Proposal amount: "+proposal);
		System.out.println("Proposal Desc: "+proposalDescription);
		Bid bid = new Bid();
		float proposals = Float.parseFloat(proposal);
		bid.setAmount(proposals);
		bid.setDescription(proposalDescription);
		userFacade.updateProposal(bid);
		//add code for calling userFacade.updateBid and do whole wiring for bid db
		return new ModelAndView("hello");
	}
	
	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
