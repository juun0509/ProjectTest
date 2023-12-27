package com.green.tonicbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.RequestBoardDao;
import com.green.tonicbank.model.RequestBoard;
import com.green.tonicbank.model.SearchCondition;

@Service
public class RequestBoardServiceImpl implements RequestBoardService {

	@Autowired
	RequestBoardDao requestBoardDao;

	@Override
	public int addRequestBoard(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.insert(requestBoard);
	}

	@Override
	public List<RequestBoard> getAllRequestBoard(SearchCondition sc) throws Exception {
		return requestBoardDao.selectAll(sc);
	}

	@Override
	public RequestBoard getRequestBoard(Integer requestBoardId) throws Exception {
		requestBoardDao.updateViewCount(requestBoardId);
		
		return requestBoardDao.select(requestBoardId);
	}
	
	@Override
	public int getCount() throws Exception {
		return requestBoardDao.count();
	}

	@Override
	public int modifyRequestBoard(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.update(requestBoard);
	}

	@Override
	public int modifyStatus(Integer requeBoardId) throws Exception {
		return requestBoardDao.updateStatus(requeBoardId);
	}
	
	@Override
	public int modifyViewCount(Integer requestBoardId) throws Exception {
		return requestBoardDao.updateViewCount(requestBoardId);
	}

	@Override
	public int removeRequestBoard(Integer requestBoardid) throws Exception {
		return requestBoardDao.delete(requestBoardid);
	}
}
