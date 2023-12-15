package com.green.tonicbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.ProdBoardDao;

@Service
public class ProdBoardServiceImpl implements ProdBoardService {

	@Autowired
	ProdBoardDao prodBoardDao;
}
