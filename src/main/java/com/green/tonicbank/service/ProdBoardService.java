package com.green.tonicbank.service;

import java.util.List;

import com.green.tonicbank.model.Product;

public interface ProdBoardService {

	List<Product> search(String keyword) throws Exception;

	int count(String keyword) throws Exception;

}
