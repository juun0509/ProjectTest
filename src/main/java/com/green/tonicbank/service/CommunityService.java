package com.green.tonicbank.service;

import java.util.List;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.CommunityComment;
import com.green.tonicbank.model.SearchCondition;

public interface CommunityService {

	int remove(Integer communityId, String userId) throws Exception;

	int write(Community community) throws Exception;

	List<Community> getAllCommunity(SearchCondition sc) throws Exception;

	int getCount(SearchCondition sc) throws Exception;
	
	Community getCommunity(Integer communityId) throws Exception;

	int modifyViewCount(Integer communityId) throws Exception;
	
	int modifyLikeCount(Integer likeCount, Integer communityId) throws Exception;
	
	int modifyCommentCount(Integer commentCount, Integer communityId) throws Exception;
	
	int getLikeCount(Integer communityId) throws Exception;
	
	int findLike(String userId, Integer communityId) throws Exception;
	
	int addLike(String userId, Integer communityId) throws Exception;
	
	int removeLike(Integer communityId, String userId) throws Exception;
	
	int writeComment(CommunityComment communityComment) throws Exception;
	
	List<CommunityComment> getComment(Integer communityId) throws Exception;
	
	CommunityComment getDetailComment(Integer communityCommentId) throws Exception;
	
	int modifyComment(CommunityComment communityComment) throws Exception;
	
	int modifyCommentChildCount(Integer communityCommentId) throws Exception;
	
	int modifyCommentGroupOrder(Integer count, CommunityComment comment) throws Exception;
	
	int removeComment(Integer communityId) throws Exception;
}