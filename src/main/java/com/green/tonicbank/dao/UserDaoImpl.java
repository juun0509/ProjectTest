package com.green.tonicbank.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.tonicbank.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	SqlSession session;
	String namespace ="userMapper.";
	
	// 회원가입
	@Override
	public int join(User user) throws Exception {
		return session.insert(namespace+"insert", user);
	}
	
	// 아이디 중복 확인
	@Override
	public int idCheck(String userId) throws Exception {
		return session.selectOne(namespace+"idCheck", userId);
	}
	
	// 닉네임 중복 확인
	@Override
	public int nickCheck(String nick) throws Exception {
		return session.selectOne(namespace+"nickCheck", nick);
	}
	
	// 이메일 중복 확인
	@Override
	public int emailCheck(String email) throws Exception {
		return session.selectOne(namespace+"emailCheck", email);
	}
}
