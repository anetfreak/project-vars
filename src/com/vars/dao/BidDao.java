package com.vars.dao;

import java.util.ArrayList;

import com.vars.domain.Bid;

public interface BidDao {
	void createBid(Bid user);
	Bid getBid(Integer id);
	ArrayList<Bid> getBidsForProjectDev(Integer id);
	ArrayList<Bid> getBidsForTester(Integer id);
}
