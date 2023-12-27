package com.green.tonicbank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.tonicbank.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession session;
		String namespace = "com.green.tonicbank.Product.";
	
	@Override
	public int delete (String name) throws Exception{
		return session.delete(namespace+"delete",name);
	}
	
	@Override
	public int insert (Product product) throws Exception{
		return session.insert(namespace+"insert",product);
	}
	
	@Override
	public Product searchName (String keyword) throws Exception{
		return session.selectOne(namespace+"searchName",keyword);
	}
	
	@Override
	public List<Product> selectIngredient (String keyword) throws Exception{
		return session.selectList(namespace+"selectIngredient",keyword);
	}
	
	@Override
	public List<Product> custom (String keyword) throws Exception{
		return session.selectList(namespace+"custom",keyword);
	}
	@Override
	public List<Product> find (Product product)throws Exception{
		return session.selectList(namespace+"find",product);
	}
	@Override
	public List<Product> search (String keyword) throws Exception{
		return session.selectList(namespace+"search",keyword);
	}
	
	@Override
	public int count (String keyword) throws Exception{
		return session.selectOne(namespace+"count",keyword);
	}

	
}

