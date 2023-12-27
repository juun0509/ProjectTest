package com.green.tonicbank.dao;

import java.util.List;

import com.green.tonicbank.model.InfoBoard;

public interface InfoBoardDao {

	int insertInfoBoard(InfoBoard infoBoard) throws Exception;

	List<InfoBoard> selectAllInfoBoard() throws Exception;
	
	List<InfoBoard> selectSearchInfoBoard(String keyword) throws Exception;

	InfoBoard selectInfoBoard(Integer infoBoardId) throws Exception;

	int updateInfoBoard(InfoBoard infoBoard) throws Exception;

	int updateInfoBoardViewCount(Integer infoBoardId) throws Exception;

	int deleteInfoBoard(Integer infoBoardId) throws Exception;

}