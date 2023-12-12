package com.green.tonicbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.CommunityDao;
import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.SearchCondition;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao communityDao;
	
	@Override
	public int remove(Integer communityId, String userId) throws Exception {
		return communityDao.delete(communityId, userId);
	}
	
	@Override
	public int write(Community community) throws Exception {
		return communityDao.insert(community);
	}
	
	@Override
	public List<Community> getAllCommunity(SearchCondition sc) throws Exception {
		return communityDao.selectAll(sc);
	}
	
	@Override
	public int getCount(SearchCondition sc) throws Exception {
		return communityDao.count(sc);
	}

	@Override
	public Community getCommunity(Integer communityId) throws Exception {
		return communityDao.select(communityId);
	}
}
