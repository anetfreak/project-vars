package com.vars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vars.domain.Bid;
import com.vars.facade.BidFacade;

@Controller
public class BidController {

	private BidFacade bidFacade;
	
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
		bidFacade.createBid(bid);
		//add code for calling userFacade.updateBid and do whole wiring for bid db
		return new ModelAndView("hello");
	}
	
	public void setBidFacade(BidFacade bidFacade) {
		this.bidFacade = bidFacade;
	}
}
