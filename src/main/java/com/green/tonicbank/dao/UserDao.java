package com.green.tonicbank.dao;

import com.green.tonicbank.model.User;

public interface UserDao {

	// 회원가입
	int join(User user) throws Exception;
	
	// 아이디 중복 확인
	int idCheck(String userId) throws Exception;

	// 닉네임 중복 확인
	int nickCheck(String nick) throws Exception;
	
	// 이메일 중복 확인
	int emailCheck(String email) throws Exception;
}