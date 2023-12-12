package com.green.tonicbank.dao;

import java.util.List;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.SearchCondition;

public interface CommunityDao {

	int deleteAll() throws Exception;

	int delete(Integer communityId, String userId) throws Exception;

	int insert(Community community) throws Exception;

	List<Community> selectAll(SearchCondition sc) throws Exception;
	
	Community select(Integer communityId) throws Exception;
	
	int count(SearchCondition sc) throws Exception;

}
