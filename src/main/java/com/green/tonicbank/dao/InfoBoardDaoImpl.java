package com.green.tonicbank.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoBoardDaoImpl implements InfoBoardDao {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.green.tonicbank.InfoBoard.";

}
