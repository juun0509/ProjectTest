package com.green.tonicbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.InfoBoardDao;
import com.green.tonicbank.model.InfoBoard;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {

	private final InfoBoardDao infoBoardDao;
	
	@Autowired
	public InfoBoardServiceImpl(InfoBoardDao infoBoardDao) {
		super();
		this.infoBoardDao = infoBoardDao;
	}

	@Override
	public int addInfoBoard(InfoBoard infoBoard) throws Exception {
		return infoBoardDao.insertInfoBoard(infoBoard);
	}

	@Override
	public List<InfoBoard> getAllInfoBoard() throws Exception {
		return infoBoardDao.selectAllInfoBoard();
	}
	
	@Override
	public List<InfoBoard> getSearchInfoBoard(String keyword) throws Exception {
		return infoBoardDao.selectSearchInfoBoard(keyword);
	}

	@Override
	public InfoBoard getInfoBoard(Integer infoBoardId) throws Exception {
		infoBoardDao.updateInfoBoardViewCount(infoBoardId);
		
		return infoBoardDao.selectInfoBoard(infoBoardId);
	}

	@Override
	public int modifyInfoBoard(InfoBoard infoBoard) throws Exception {
		return infoBoardDao.updateInfoBoard(infoBoard);
	}

	@Override
	public int modifyInfoBoardViewCount(Integer infoBoardId) throws Exception {
		return infoBoardDao.updateInfoBoardViewCount(infoBoardId);
	}

	@Override
	public int removeInfoBoard(Integer infoBoardId) throws Exception {
		return infoBoardDao.deleteInfoBoard(infoBoardId);
	}

}
