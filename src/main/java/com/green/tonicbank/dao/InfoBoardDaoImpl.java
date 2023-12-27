package com.green.tonicbank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.tonicbank.model.InfoBoard;

@Repository
public class InfoBoardDaoImpl implements InfoBoardDao {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.green.tonicbank.InfoBoard.";
	
	@Override
	public int insertInfoBoard(InfoBoard infoBoard) throws Exception {
		return session.insert(namespace + "insertInfoBoard", infoBoard);
	}
	
	@Override
	public List<InfoBoard> selectAllInfoBoard() throws Exception {
		return session.selectList(namespace + "selectAllInfoBoard");
	}
	
	@Override
	public List<InfoBoard> selectSearchInfoBoard(String keyword) throws Exception {
		return session.selectList(namespace + "selectSearchInfoBoard", keyword);
	}
	
	@Override
	public InfoBoard selectInfoBoard(Integer infoBoardId) throws Exception {
		return session.selectOne(namespace + "selectInfoBoard", infoBoardId);
	}
	
	@Override
	public int updateInfoBoard(InfoBoard infoBoard) throws Exception {
		return session.update(namespace + "updateInfoBoard", infoBoard);
	}
	
	@Override
	public int updateInfoBoardViewCount(Integer infoBoardId) throws Exception {
		return session.update(namespace + "updateInfoBoardViewCount", infoBoardId);
	}
	
	@Override
	public int deleteInfoBoard(Integer infoBoardId) throws Exception {
		return session.delete(namespace + "deleteInfoBoard", infoBoardId);
	}


}
