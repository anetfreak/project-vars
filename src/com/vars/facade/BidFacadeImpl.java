package com.vars.facade;

import java.util.ArrayList;

import com.vars.dao.BidDao;
import com.vars.domain.Bid;

public class BidFacadeImpl implements BidFacade {

	private BidDao bidDao;
	
	@Override
	public void createBid(Bid bid) {
		// TODO Auto-generated method stub
	}

	@Override
	public Bid getBid(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Bid> getBidsForProject(Integer id) {
		// TODO Auto-generated method stub
		return bidDao.getBidsForProjectDev(id);
	}

	@Override
	public ArrayList<Bid> getBidsForTester(Integer id) {
		// TODO Auto-generated method stub
		return bidDao.getBidsForTester(id);
	}

	public void setBidDao(BidDao bidDao) {
		this.bidDao = bidDao;
	}
	
}