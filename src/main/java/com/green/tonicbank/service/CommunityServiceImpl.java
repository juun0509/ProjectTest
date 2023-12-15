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

	@Override
	public int writeComment(CommunityComment communityComment) throws Exception {
		return communityDao.insertComment(communityComment);
	}

	@Override
	public List<CommunityComment> getComment(Integer communityId) throws Exception {
		return communityDao.selectComment(communityId);
	}

	@Override
	public int modifyComment(CommunityComment communityComment) throws Exception {
		return communityDao.updateComment(communityComment);
	}

	@Override
	public int removeComment(Integer communityCommentId, String userId) throws Exception {
		return communityDao.delete(communityCommentId, userId);
	}
}
