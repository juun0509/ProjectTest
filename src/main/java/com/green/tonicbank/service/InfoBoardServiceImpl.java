package com.green.tonicbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.InfoBoardDao;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {

	@Autowired
	InfoBoardDao infoBoardDao;
}
