package com.vars.facade;

import java.util.ArrayList;

import com.vars.domain.Bid;

public interface BidFacade {
	void createBid(Bid bid);
	Bid getBid(Integer id);
	ArrayList<Bid> getBidsForProject(Integer id);
	ArrayList<Bid> getBidsForTester(Integer id);
}
