package com.green.tonicbank.dao;

import java.util.List;

import com.green.tonicbank.model.Product;

public interface ProductDao {

	int delete(String name) throws Exception;

	int insert(Product product) throws Exception;

	Product searchName(String keyword) throws Exception;

	List<Product> selectIngredient(String keyword) throws Exception;

	List<Product> custom(String keyword) throws Exception;

}