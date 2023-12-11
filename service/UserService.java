package com.green.tonicbank.service;

import com.green.tonicbank.model.User;

public interface UserService {

	// 회원가입
	int join(User user) throws Exception;
	
	// 유저 가져오기
	User select(String userId) throws Exception;
	
	//아이디 중복 확인
	int idCheck(String userId) throws Exception;

	// 닉네임 중복 확인
    int nickCheck(String nick) throws Exception;
    
    // 이메일 중복 확인
    int emailCheck(String email) throws Exception;
    
}