package com.green.tonicbank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.tonicbank.model.RequestBoard;
import com.green.tonicbank.model.SearchCondition;

@Repository
public class RequestBoardDaoImpl implements RequestBoardDao {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.green.tonicbank.RequestBoard.";

	@Override
	public int insert(RequestBoard requestBoard) throws Exception {
		return session.insert(namespace + "insert", requestBoard);
	}

	@Override
	public List<RequestBoard> selectAll(SearchCondition sc) throws Exception {
		return session.selectList(namespace + "selectAll", sc);
	}

	@Override
	public RequestBoard select(Integer requestBoardId) throws Exception {
		return session.selectOne(namespace + "select", requestBoardId);
	}
	
	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "count");
	}

	@Override
	public int update(RequestBoard requestBoard) throws Exception {
		return session.update(namespace + "update", requestBoard);
	}

	@Override
	public int updateStatus(Integer requestBoardId) throws Exception {
		return session.update(namespace + "updateStatus", requestBoardId);
	}
	
	@Override
	public int updateViewCount(Integer requestBoardId) throws Exception {
		return session.update(namespace + "updateViewCount", requestBoardId);
	}

	@Override
	public int delete(Integer requestBoardId) throws Exception {
		return session.delete(namespace + "delete", requestBoardId);
	}
}
