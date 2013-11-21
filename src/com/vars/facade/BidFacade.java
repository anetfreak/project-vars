package com.vars.facade;

import java.util.List;

import com.vars.domain.Bid;

public interface BidFacade {
	void createBid(Bid bid);
	Bid getBid(Integer id);
	List<Bid> getBidsForProject(Integer id);
	List<Bid> getBidsForTester(Integer id);
}
