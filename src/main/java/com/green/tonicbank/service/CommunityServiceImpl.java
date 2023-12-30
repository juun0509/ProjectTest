package com.green.tonicbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.CommunityDao;
import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.CommunityComment;
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
	
	@Override
	public List<Community> getReview(String productName) throws Exception {
		return communityDao.selectReview(productName);
	}
	
	@Override
	public int modifyCommunity(Community community) throws Exception {
		return communityDao.updateCommunity(community);
	}

	@Override
	public int modifyViewCount(Integer communityId) throws Exception {
		return communityDao.updateViewCount(communityId);
	}

	@Override
	public int modifyLikeCount(Integer likeCount, Integer communityId) throws Exception {
		return communityDao.updateLikeCount(likeCount, communityId);
	}

	@Override
	public int modifyCommentCount(Integer commentCount, Integer communityId) throws Exception {
		return communityDao.updateCommentCount(commentCount, communityId);
	}
	
	/**
	 * 좋아요
	 */
	@Override
	public int getLikeCount(Integer communityId) throws Exception {
		return communityDao.selectAllLike(communityId);
	}

	@Override
	public int findLike(String userId, Integer communityId) throws Exception {
		return communityDao.selectLike(userId, communityId);
	}

	@Override
	public int addLike(String userId, Integer communityId) throws Exception {
		return communityDao.insertLike(userId, communityId);
	}

	@Override
	public int removeLike(Integer communityId, String userId) throws Exception {
		return communityDao.deleteLike(communityId, userId);
	}

	/**
	 * 댓글
	 */
	@Override
	public int writeComment(CommunityComment communityComment) throws Exception {
		int rowCnt = communityDao.insertComment(communityComment);
		
		if (rowCnt == 1)
			rowCnt = communityDao.updateCommentCount(1, communityComment.getCommunityId());
		
		return rowCnt; 
	}

	@Override
	public List<CommunityComment> getComment(Integer communityId) throws Exception {
		return communityDao.selectComment(communityId);
	}
	
	@Override
	public CommunityComment getDetailComment(Integer communityCommentId) throws Exception {
		return communityDao.selectDetailComment(communityCommentId);
	}
 
	@Override
	public int modifyComment(CommunityComment communityComment) throws Exception {
		return communityDao.updateComment(communityComment);
	}
	
	@Override
	public int modifyCommentChildCount(Integer communityCommentId) throws Exception {
		return communityDao.updateCommentChildCount(communityCommentId);
	}
	
	@Override
	public int modifyCommentGroupOrder(Integer count, CommunityComment comment) throws Exception {
		return communityDao.updateCommentGroupOrder(count, comment);
	}

	@Override
	public int removeComment(Integer communityId) throws Exception {
		int rowCnt = communityDao.deleteComment();
		
		if (rowCnt == 1)
			communityDao.updateCommentCount(-1, communityId);
		
		return rowCnt;
	}
}
