package com.vars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Bid;
import com.vars.domain.Project;
import com.vars.domain.Tester;
import com.vars.domain.User;
import com.vars.facade.BidFacade;
import com.vars.facade.ProjectFacade;

@Controller
public class BidController {

	private BidFacade bidFacade;
	private ProjectFacade projectFacade;

	public void setProjectFacade(ProjectFacade projectFacade) {
		this.projectFacade = projectFacade;
	}

	@RequestMapping(value = "tester_proposal.htm", method = RequestMethod.POST)
	public ModelAndView tester_proposal(@RequestParam("projectTitle") String projectTitle, 
			@RequestParam("proposal") String proposal, 
			@RequestParam("proposalDescription") String proposalDescription,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("Project Title: "+projectTitle);
		System.out.println("Proposal amount: "+proposal);
		System.out.println("Proposal Desc: "+proposalDescription);
		Bid bid = new Bid();
		User user = (User) session.getAttribute("user");
		float proposals = Float.parseFloat(proposal);

		Tester tester = user.getTester();
		bid.setTester(tester.getId());
		bid.setAmount(proposals);
		bid.setDescription(proposalDescription);
		bidFacade.createBid(bid);
		//add code for calling userFacade.updateBid and do whole wiring for bid db
		modelAndView.setViewName("hello");
		return modelAndView;
	}
	
	@RequestMapping(value = "/project/bids/{id}.htm", method = RequestMethod.GET)
	public ModelAndView passProject(@PathVariable("id") String id) {
		Project project = projectFacade.getProject(Integer.parseInt(id));
		return new ModelAndView("tester_proposal", "project", project);
	}
	
	@RequestMapping(value = "/bids/{projectId}.htm", method = RequestMethod.GET)
	public ModelAndView showBids(@PathVariable("projectId") Integer id) {
		
		return new ModelAndView("bid", "bids", bidFacade.getBidsForProject(id));
	}
	
	public void setBidFacade(BidFacade bidFacade) {
		this.bidFacade = bidFacade;
	}

}
