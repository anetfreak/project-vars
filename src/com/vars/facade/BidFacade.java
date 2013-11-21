package com.vars.facade;

import java.util.List;

import com.vars.domain.Bid;
import com.vars.domain.Project;

public interface BidFacade {
	void createBid(Bid bid);
	Project getBid(Integer id);
	List<Bid> getBidsForProject(Integer id);
	List<Bid> getBidsForTester(Integer id);
}
