package com.green.tonicbank.service;

import java.util.List;

import com.green.tonicbank.model.RequestBoard;
import com.green.tonicbank.model.SearchCondition;

public interface RequestBoardService {

	public int addRequestBoard(RequestBoard requestBoard) throws Exception;
	
	public List<RequestBoard> getAllRequestBoard(SearchCondition sc) throws Exception;
	
	public RequestBoard getRequestBoard(Integer requestBoardId) throws Exception;
	
	public int getCount() throws Exception;
	
	public int modifyRequestBoard(RequestBoard requestBoard) throws Exception;
	
	public int modifyStatus(Integer requeBoardId) throws Exception;
	
	public int modifyViewCount(Integer requestBoardId) throws Exception;
	
	public int removeRequestBoard(Integer requestBoardid) throws Exception;
}