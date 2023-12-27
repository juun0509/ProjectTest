package com.green.tonicbank.dao;

import java.util.List;

import com.green.tonicbank.model.RequestBoard;
import com.green.tonicbank.model.SearchCondition;

public interface RequestBoardDao {

	public int insert(RequestBoard requestBoard) throws Exception;
	
	public List<RequestBoard> selectAll(SearchCondition sc) throws Exception;
	
	public RequestBoard select(Integer requestBoardId) throws Exception;
	
	public int count() throws Exception;
	
	public int update(RequestBoard requestBoard) throws Exception;
	
	public int updateStatus(Integer requestBoardId) throws Exception;
	
	public int updateViewCount(Integer requestBoardId) throws Exception;
	
	public int delete(Integer requestBoardId) throws Exception;
}