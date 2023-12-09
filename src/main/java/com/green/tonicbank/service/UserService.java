package com.green.tonicbank.service;

import com.green.tonicbank.model.User;

public interface UserService {

	// 회원가입
	int join(User user) throws Exception;
	
	//아이디 중복 확인
	int idCheck(String userId) throws Exception;

}