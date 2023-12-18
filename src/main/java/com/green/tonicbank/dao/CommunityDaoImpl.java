package com.green.tonicbank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.CommunityComment;
import com.green.tonicbank.model.SearchCondition;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	SqlSession session;
	
	String namespace = "com.green.tonicbank.Community.";
	
	@Override
	public int deleteAll() throws Exception  {
		return session.delete(namespace + "deleteAll");
	}
	
	@Override
	public int delete(Integer communityId, String userId) throws Exception  {
		Map map = new HashMap();
		map.put("communityId", communityId);
		map.put("userId", userId);
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int insert(Community community) throws Exception {
		return session.insert(namespace + "insert", community);
	}
	
	@Override
	public List<Community> selectAll(SearchCondition sc) throws Exception {
		
		return session.selectList(namespace + "selectAll", sc);
	}

	@Override
	public int count(SearchCondition sc) throws Exception {
		return session.selectOne(namespace + "count", sc);
	}

	@Override
	public Community select(Integer communityId) throws Exception {
		return session.selectOne(namespace + "select", communityId);
	}

	@Override
	public int updateViewCount(Integer communityId) throws Exception {
		return session.update(namespace + "updateViewCount", communityId);
	}

	@Override
	public int updateLikeCount(Integer likeCount, Integer communityId) throws Exception {
		Map map = new HashMap();
		map.put("likeCount", likeCount);
		map.put("communityId", communityId);
		return session.update(namespace + "updateLikeCount", map);
	}

	@Override
	public int updateCommentCount(Integer commentCount, Integer communityId) throws Exception {
		Map map = new HashMap();
		map.put("commentCount", commentCount);
		map.put("communityId", communityId);
		return session.update(namespace + "updateCommentCount", map);
	}
	
	/**
	 * 좋아요
	 */
	@Override
	public int selectAllLike(Integer communityId) throws Exception {
		return session.selectOne(namespace + "selectAllLike", communityId);
	}

	@Override
	public int selectLike(String userId, Integer communityId) throws Exception {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("communityId", communityId);
		return session.selectOne(namespace + "selectLike", map);
	}

	@Override
	public int insertLike(String userId, Integer communityId) throws Exception {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("communityId", communityId);
		return session.insert(namespace + "insertLike", map);
	}

	@Override
	public int deleteLike(Integer communityId, String userId) throws Exception {
		Map map = new HashMap();
		map.put("communityId", communityId);
		map.put("userId", userId);
		return session.delete(namespace + "deleteLike", map);
	}

	/**
	 * 댓글
	 */
	@Override
	public int insertComment(CommunityComment communityComment) throws Exception {
		return session.insert(namespace + "insertComment", communityComment);
	}

	@Override
	public List<CommunityComment> selectComment(Integer communityId) throws Exception {
		return session.selectList(namespace + "selectComment", communityId);
	}
	
	@Override
	public CommunityComment selectDetailComment(Integer communityCommentId) throws Exception {
		return session.selectOne(namespace + "selectDetailComment", communityCommentId);
	}

	@Override
	public int updateComment(CommunityComment communityComment) throws Exception {
		return session.update(namespace + "updateComment", communityComment);
	}
	
	@Override
	public int updateCommentChildCount(Integer communityCommentId) throws Exception {
		return session.update(namespace + "updateCommentChildCount", communityCommentId);
	}
	
	@Override
	public int updateCommentGroupOrder(Integer count, CommunityComment comment) throws Exception {
		Map map = new HashMap();
		map.put("count", count);
		map.put("comment", comment);
		return session.update(namespace + "updateCommentGroupOrder", map);
	}

	@Override
	public int deleteComment() throws Exception {
		return session.delete(namespace + "deleteComment");
	}
}
