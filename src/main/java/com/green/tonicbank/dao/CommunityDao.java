package com.green.tonicbank.dao;

import java.util.List;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.CommunityComment;
import com.green.tonicbank.model.SearchCondition;

public interface CommunityDao {

	int deleteAll() throws Exception;

	int delete(Integer communityId, String userId) throws Exception;

	int insert(Community community) throws Exception;

	List<Community> selectAll(SearchCondition sc) throws Exception;

	int count(SearchCondition sc) throws Exception;

	Community select(Integer communityId) throws Exception;
	
	List<Community> selectReview(String productName) throws Exception;
	
	int updateCommunity(Community community) throws Exception;

	int updateViewCount(Integer communityId) throws Exception;
	
	int updateLikeCount(Integer likeCount, Integer communityId) throws Exception;
	
	int updateCommentCount(Integer commentCount, Integer communityId) throws Exception;
	
	int selectAllLike(Integer communityId) throws Exception;
	
	int selectLike(String userId, Integer communityId) throws Exception;
	
	int insertLike(String userId, Integer communityId) throws Exception;
	
	int deleteLike(Integer communityId, String userId) throws Exception;
	
	int insertComment(CommunityComment communityComment) throws Exception;
	
	List<CommunityComment> selectComment(Integer communityId) throws Exception;
	
	CommunityComment selectDetailComment(Integer communityCommentId) throws Exception;
	
	int updateComment(CommunityComment communityComment) throws Exception;
	
	int updateCommentChildCount(Integer communityCommentId) throws Exception;
	
	int updateCommentGroupOrder(Integer count, CommunityComment comment) throws Exception;
	
	int deleteComment() throws Exception;
	
}