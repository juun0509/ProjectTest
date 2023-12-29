package com.green.tonicbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.ProductDao;
import com.green.tonicbank.model.Product;

@Service
public class ProdBoardServiceImpl implements  ProdBoardService {

	@Autowired
	ProductDao pdao;
 	
	@Override
	public List<Product> search(String keyword) throws Exception{
		return pdao.search(keyword);
	}
	
	@Override
	public int count (String keyword) throws Exception{
		return pdao.count(keyword);
	}
}
