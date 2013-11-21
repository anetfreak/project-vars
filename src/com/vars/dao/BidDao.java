package com.vars.dao;

import java.util.List;

import com.vars.domain.Bid;

public interface BidDao {
	void createBid(Bid user);
	Bid getBid(Integer id);
	List<Bid> getBidsForProjectDev(Integer id);
	List<Bid> getBidsForTester(Integer id);
}
