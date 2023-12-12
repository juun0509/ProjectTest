package com.green.tonicbank.service;

import java.util.List;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.SearchCondition;

public interface CommunityService {

	int remove(Integer communityId, String userId) throws Exception;

	int write(Community community) throws Exception;

	List<Community> getAllCommunity(SearchCondition sc) throws Exception;

	int getCount(SearchCondition sc) throws Exception;
	
	Community getCommunity(Integer communityId) throws Exception;

}
