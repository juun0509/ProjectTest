package com.green.tonicbank.service;

import java.util.List;

import com.green.tonicbank.model.InfoBoard;

public interface InfoBoardService {

	public int addInfoBoard(InfoBoard infoBoard) throws Exception;
	
	public List<InfoBoard> getAllInfoBoard() throws Exception;
	
	public List<InfoBoard> getSearchInfoBoard(String keyword) throws Exception;
	
	public InfoBoard getInfoBoard(Integer infoBoardId) throws Exception;
	
	public int modifyInfoBoard(InfoBoard infoBoard) throws Exception;
	
	public int modifyInfoBoardViewCount(Integer infoBoardId) throws Exception;
	
	public int removeInfoBoard(Integer infoBoardId) throws Exception;
}